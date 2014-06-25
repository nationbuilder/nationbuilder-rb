class NationBuilder::Client

  def initialize(nation_name, api_key)
    @nation_name = nation_name
    @api_key = api_key
    @endpoints = NationBuilder::SpecParser
      .parse(File.join(File.dirname(__FILE__), 'api_spec.json'))
    @name_to_endpoint = {}
    @endpoints.each do |endpoint|
      @name_to_endpoint[endpoint.name] = endpoint
    end
  end

  def [](endpoint)
    @name_to_endpoint[endpoint]
  end

  def endpoints
    @name_to_endpoint.keys
  end

  def base_url
    @base_url ||=
      NationBuilder::URL_TEMPLATE.gsub(':nation_name', @nation_name)
  end

  def call(endpoint_name, method_name, args={})
    endpoint = self[endpoint_name]
    method = endpoint[method_name]
    body = args.delete(:body) || {}
    method.validate_args(args)
    url = NationBuilder.generate_url(base_url, method.uri, args)
    puts url
    request_args = {
      header: {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    }

    if [:get].include?(method.http_method)
      request_args[:query] = body
      request_args[:query][:access_token] = @api_key
    else
      request_args[:body] = body
    end

    response = HTTPClient.send(method.http_method, url, request_args)
  end

end

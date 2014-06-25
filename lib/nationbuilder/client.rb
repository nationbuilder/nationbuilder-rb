class NationBuilder::Client

  def initialize(nation_name, api_key)
    @nation_name = nation_name
    @api_key = api_key
    @name_to_endpoint = {}
    parsed_endpoints.each do |endpoint|
      @name_to_endpoint[endpoint.name] = endpoint
    end
  end

  def parsed_endpoints
    NationBuilder::SpecParser
      .parse(File.join(File.dirname(__FILE__), 'api_spec.json'))
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
    nonmethod_args = method.nonmethod_args(args)
    method_args = method.method_args(args)
    method.validate_args(method_args)
    url = NationBuilder.generate_url(base_url, method.uri, method_args)

    request_args = {
      header: {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    }

    if method.http_method == :get
      request_args[:query] = nonmethod_args
      request_args[:query][:access_token] = @api_key
    else
      nonmethod_args[:access_token] = @api_key
      request_args[:body] = JSON(nonmethod_args)
    end

    response = HTTPClient.send(method.http_method, url, request_args)
    return parse_response_body(response)
  end

  class ServerResponseError < StandardError; end

  def parse_response_body(response)
    success = response.code.to_s.start_with?('2')

    if response.header['Content-Type'].first != 'application/json'
      return {} if success
      raise ServerResponseError.new("Non-JSON content-type for server response: #{response.body}")
    end

    body = response.body.strip
    return {} if body.length == 0
    return JSON.parse(body)
  end

end

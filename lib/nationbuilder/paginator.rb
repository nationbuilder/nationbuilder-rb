class NationBuilder::Paginator
  attr_reader :body

  def initialize(client, body)
    @client = client
    @body = body
  end

  [:next, :prev].each do |page_type|
    define_method(:"#{page_type}?") do
      @body[page_type.to_s]
    end

    define_method(:"#{page_type}") do |call_body = {}|
      return nil unless send(:"#{page_type}?")
      path = send(:"#{page_type}?").split('/api/v1').last
      call_body[:limit] ||= CGI.parse(path)['limit'][0]
      results = @client.raw_call(path, :get, call_body)
      return self.class.new(@client, results)
    end
  end

end

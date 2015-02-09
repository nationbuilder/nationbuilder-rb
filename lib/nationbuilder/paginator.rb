class Paginator
  attr_reader :body

  def initialize(client, body)
    @client = client
    @body = body
  end

  [:next, :prev].each do |page_type|
    define_method(:"#{page_type}?") do
      @body[page_type.to_s]
    end

    define_method(:"#{page_type}") do
      return nil unless send(:"#{page_type}?")
      path = send(:"#{page_type}?").split('/api/v1').last
      results = @client.raw_call(path, :get)
      return Paginator.new(@client, results)
    end
  end

end

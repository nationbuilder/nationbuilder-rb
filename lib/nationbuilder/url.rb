module NationBuilder

  class URL

    def initialize(url_template)
      @url_template = url_template
    end

    def generate_url(extension, parameters)
      url = URI.join(@url_template, '/api/v1' + extension).to_s
      parameters.each { |name, value| url.gsub!(name.inspect, value.to_s) }
      url
    end

  end

end

require 'httpclient'
require 'json'
require 'set'
require 'uri'

module NationBuilder

  URL_TEMPLATE = 'https://:nation_name.nationbuilder.com'

  def self.generate_url(base_url, extension, parameters)
    url = URI.join(base_url, '/api/v1' + extension).to_s
    parameters.each do |name, value|
      url.gsub!(name.inspect, value.to_s)
    end
    url
  end

  def self.print_description
    client = NationBuilder::Client.new('test-nation', 'test-key')
    client.endpoints.each do |endpoint_name|
      endpoint_str = "Endpoint: #{endpoint_name}"
      puts "=" * endpoint_str.length
      puts endpoint_str
      puts "=" * endpoint_str.length

      client[endpoint_name].methods.each do |method_name|
        puts
        method = client[endpoint_name][method_name]
        puts "  Method: #{method_name.inspect}"
        puts "  Description: #{method.description}"
        required_params = method.parameters.map { |p| p.inspect }
        if required_params.any?
          puts "  Required parameters: #{required_params.join(', ')}"
        end
      end
      puts
    end
  end
end

require 'nationbuilder/client'
require 'nationbuilder/endpoint'
require 'nationbuilder/method'
require 'nationbuilder/parameter'
require 'nationbuilder/spec_parser'

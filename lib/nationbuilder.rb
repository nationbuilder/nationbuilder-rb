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

end

require 'nationbuilder/client'
require 'nationbuilder/endpoint'
require 'nationbuilder/method'
require 'nationbuilder/parameter'
require 'nationbuilder/spec_parser'

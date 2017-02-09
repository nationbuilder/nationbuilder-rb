module NationBuilder
  class BaseError < StandardError; end

  class ResponseError < BaseError
    attr_reader :response
    def initialize(response = nil)
      super(response ? response.body : nil)
      @response = response
    end
  end

  class ServerError < ResponseError; end
  class ClientError < ResponseError; end
  class RateLimitedError < ClientError; end
end

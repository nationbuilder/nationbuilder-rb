module NationBuilder
  class BaseError < StandardError; end
  class ServerError < BaseError; end
  class ClientError < BaseError; end
  class RateLimitedError < ClientError; end
end

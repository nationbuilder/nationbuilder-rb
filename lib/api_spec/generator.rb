module ApiSpec
  class APIObject
    class << self
      attr_accessor :nested_name, :nested_class, :nested_adder_name
    end

    def nested_name
      self.class.nested_name
    end

    def nested_class
      self.class.nested_class
    end

    def initialize(name)
      @name = name
      send("#{nested_name}=".to_sym, []) if nested_name
    end

    def to_hash
      pairs = self.class::JSON_NAMES.map do |name, json_name|
        [json_name, send(name)]
      end

      hash = Hash[pairs]

      if nested_name
        hash[nested_name.to_s] = send(nested_name).map { |obj| obj.to_hash }
      end

      hash
    end

    def self.init(base)
      base.send(:attr_accessor, *base::JSON_NAMES.keys)
      base.send(:attr_accessor, base.nested_name) if base.nested_name
      base.send(:define_method, base.nested_adder_name) do |name, &block|
        obj = nested_class.new(name)
        block.call(obj)
        send(nested_name) << obj
      end if base.nested_adder_name
    end

  end

  class Parameter < APIObject

    JSON_NAMES = {
      name: 'Name',
      required: 'Required',
      default: 'Default',
      type: 'Type',
      description: 'Description'
    }

    init(self)

  end

  class Method < APIObject

    JSON_NAMES = {
      name: "MethodName",
      synopsis: "Synopsis",
      http_method: "HTTPMethod",
      uri: "URI"
    }

    self.nested_name = :parameters
    self.nested_adder_name = :parameter
    self.nested_class = Parameter

    init(self)

  end

  class Endpoint < APIObject

    JSON_NAMES = {
      name: "name",
    }

    self.nested_name = :methods
    self.nested_adder_name = :method
    self.nested_class = ApiSpec::Method

    init(self)

  end

  class Spec < APIObject

    class << self
      attr_accessor :endpoints
    end

    self.endpoints = []

    def self.to_hash
      { 'endpoints' => endpoints.map { |endpoint| endpoint.to_hash } }
    end

    def self.write_spec(path)
      File.open(path, 'w') { |f| f.write(JSON.pretty_generate(to_hash)) }
    end

    def self.endpoint(name)
      endpoint = Endpoint.new(name)
      yield endpoint
      endpoints << endpoint
    end
  end
end

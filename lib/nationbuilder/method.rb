class NationBuilder::Method

  attr_reader :uri, :http_method

  def initialize(name, http_method, uri)
    @name = name
    @http_method = http_method.downcase.to_sym
    @uri = uri
    @name_to_parameter = {}
  end

  def register_parameter(parameter)
    @name_to_parameter[parameter.name] = parameter
  end

  def parameters
    @parameters ||= @name_to_parameter.keys
  end

  def name
    @name.downcase.gsub(' ', '_').to_sym
  end

  def validate_args(args)
    if Set.new(args.keys) != Set.new(parameters)
      raise ArgumentError
        .new("Required args: #{parameters.join(', ')}. Provided args: #{args.keys.join(', ')}")
    end
  end

end

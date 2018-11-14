class NationBuilder::Method

  attr_reader :uri, :http_method, :description

  def initialize(name, http_method, uri, description)
    @name = name
    @http_method = http_method.downcase.to_sym
    @uri = uri
    @description = description
    @name_to_parameter = {}
  end

  def register_parameter(parameter)
    @name_to_parameter[parameter.name] = parameter
  end

  def parameters
    @name_to_parameter.keys
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

  def method_args(args)
    args.each_with_object({}) do |(k, v), a|
      a[k] = v if parameters.include?(k)
    end
  end

  def nonmethod_args(args)
    args.each_with_object({}) do |(k, v), a|
      a[k] = v unless parameters.include?(k)
    end
  end

end

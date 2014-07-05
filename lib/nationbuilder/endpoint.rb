class NationBuilder::Endpoint

  def initialize(name)
    @name = name
    @name_to_method = {}
  end

  def name
    @name.downcase.gsub(' ', '_').to_sym
  end

  def register_method(method)
    @name_to_method[method.name] = method
  end

  def methods
    @methods ||= @name_to_method.keys
  end

  class InvalidMethod < ArgumentError; end

  def [](method_name)
    m = @name_to_method[method_name]
    raise InvalidMethod.new(method_name) if m.nil?
    m
  end

end

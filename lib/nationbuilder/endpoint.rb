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

  def [](method_name)
    @name_to_method[method_name]
  end

end

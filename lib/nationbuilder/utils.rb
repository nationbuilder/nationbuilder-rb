module NationBuilder::Utils
  module QueryParams
    module_function

    def encode(value, key = nil, output = {})
      case value
      when Hash  then value.each { |k, v| encode(v, append_key(key, k), output) }
      when Array then value.each { |v|    encode(v, "#{key}[]", output) }
      when nil   then ''
      else
        output[key] = value
      end
      output
    end

    def append_key(root_key, key)
      root_key.nil? ? "#{key}" : "#{root_key}[#{key}]"
    end

    private_class_method :append_key
  end
end

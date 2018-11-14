class NationBuilder::SpecParser

  def self.parse(spec_path)
    spec = JSON.parse(File.read(spec_path))

    spec['endpoints'].each_with_object([]) do |endpoint, endpoints|
      nb_endpoint = NationBuilder::Endpoint.new(endpoint['name'])
      endpoints << nb_endpoint
      endpoint['methods'].each do |method|
        nb_method = NationBuilder::Method.new(method['MethodName'],
                                              method['HTTPMethod'],
                                              method['URI'],
                                              method['Synopsis'])
        nb_endpoint.register_method(nb_method)
        method['parameters'].each do |parameter|
          if (parameter['Required'] == 'Y') && (parameter['Name'] != 'body')
            nb_parameter = NationBuilder::Parameter.new(parameter['Name'])
            nb_method.register_parameter(nb_parameter)
          end
        end
      end
    end

  end

end

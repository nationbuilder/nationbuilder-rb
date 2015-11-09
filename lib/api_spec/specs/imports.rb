class ApiSpec::Spec

  endpoint 'Imports' do |import|

    import.method('Show') do |method|
      method.synopsis = 'Shows the status of an import'
      method.http_method = 'GET'
      method.uri = '/imports/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the import'
      end
    end

    import.method('Create') do |method|
      method.synopsis = 'Creates a import with the provided data'
      method.http_method = 'POST'
      method.uri = '/imports'

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON representation of the import'
      end
    end

    import.method('Result') do |method|
      method.synopsis = 'Gets the import results and error csv file.'
      method.http_method = 'GET'
      method.uri = '/imports/:id/result'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the import'
      end
    end
  end
end

class ApiSpec::Spec

  endpoint 'Precincts' do |precinct|

    precinct.method('Index') do |method|
      method.synopsis = 'Returns a list of current precincts'
      method.http_method = 'GET'
      method.uri = '/precincts'

      method.parameter('__token') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination token'
      end

      method.parameter('__nonce') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination nonce'
      end

      method.parameter('limit') do |p|
        p.required = 'N'
        p.default = '10'
        p.type = 'int'
        p.description = 'maximum number of results to return'
      end
    end

    precinct.method('Show') do |method|
      method.synopsis = 'Returns a representation of the precinct'
      method.http_method = 'GET'
      method.uri = '/precincts/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'int'
        p.description = "the precinct's ID"
      end
    end

    precinct.method('Create') do |method|
      method.synopsis = 'Creates a precinct with the provided data'
      method.http_method = 'POST'
      method.uri = '/precincts'

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'a JSON representation of the precinct to create'
      end
    end

    precinct.method('Update') do |method|
      method.synopsis = 'Updates a precinct with the provided data'
      method.http_method = 'PUT'
      method.uri = '/precincts/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the precinct's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating the precinct'
      end
    end

    precinct.method('Destroy') do |method|
      method.synopsis = 'Removes the precinct with the matching ID'
      method.http_method = 'DELETE'
      method.uri = '/precincts/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the precinct's ID"
      end
    end
  end
end

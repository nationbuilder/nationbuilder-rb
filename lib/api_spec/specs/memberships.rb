class ApiSpec::Spec

  endpoint 'Memberships' do |memberships|

    memberships.method('Index') do |method|
      method.synopsis = 'Lists all memberships for a person'
      method.http_method = 'GET'
      method.uri = '/people/:person_id/memberships'

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'The person\'s ID'
      end

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

    memberships.method('Create') do |method|
      method.synopsis = 'Creates a membership'
      method.http_method = 'POST'
      method.uri = '/people/:person_id/memberships'

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'The person\'s ID'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for the new membership'
      end
    end

    memberships.method('Update') do |method|
      method.synopsis = 'Updates a membership'
      method.http_method = 'PUT'
      method.uri = '/people/:person_id/memberships'

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'The person\'s ID'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating a membership'
      end
    end

    memberships.method('Destroy') do |method|
      method.synopsis = 'Removes a membership from the person'
      method.http_method = 'DELETE'
      method.uri = '/people/:person_id/memberships/:name'

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'The person\'s ID'
      end

      method.parameter('name') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'The name of the membership'
      end
    end

  end

end

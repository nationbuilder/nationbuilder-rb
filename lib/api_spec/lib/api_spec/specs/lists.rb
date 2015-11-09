class ApiSpec::Spec

  endpoint 'Lists' do |lists|

    lists.method('Index') do |method|
      method.synopsis = 'Returns a list of created custom lists'
      method.http_method = 'GET'
      method.uri = '/lists'

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

    lists.method('People') do |method|
      method.synopsis = 'Returns people stored in a list'
      method.http_method = 'GET'
      method.uri = '/lists/:id/people'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
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

    lists.method('Create') do |method|
      method.synopsis = 'Creates a list with the provided data'
      method.http_method = 'POST'
      method.uri = '/lists'

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'a JSON representation of the list to create'
      end
    end

    lists.method('Update') do |method|
      method.synopsis = 'Updates a list with the provided data'
      method.http_method = 'PUT'
      method.uri = '/lists/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating the list'
      end
    end

    lists.method('Destroy') do |method|
      method.synopsis = 'Removes the list with the matching ID'
      method.http_method = 'DELETE'
      method.uri = '/lists/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end
    end

    lists.method('Add people') do |method|
      method.synopsis = 'Adds people to a list'
      method.http_method = 'POST'
      method.uri = '/lists/:list_id/people'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'A JSON hash containing the people to add to the list'
      end
    end

    lists.method('Destroy people') do |method|
      method.synopsis = 'Removes people from a list'
      method.http_method = 'DELETE'
      method.uri = '/lists/:list_id/people'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'A JSON hash containing the people to remove from the list'
      end
    end

    lists.method('Listing Create (deprecated)') do |method|
      method.synopsis = 'Adds a person to a list'
      method.http_method = 'POST'
      method.uri = '/lists/:list_id/listings'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person to add to the list'
      end
    end

    lists.method('Listing Deletion (deprecated)') do |method|
      method.synopsis = 'Drops a person from a list'
      method.http_method = 'DELETE'
      method.uri = '/lists/:list_id/listings/:person_id'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person to drop from the list'
      end
    end

    lists.method('Add tag') do |method|
      method.synopsis = 'Adds a tag to all of the list members'
      method.http_method = 'POST'
      method.uri = '/lists/:list_id/tag/:tag'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('tag') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the name of the tag to use'
      end
    end

    lists.method('Delete tag') do |method|
      method.synopsis = 'Deletes the tag from all of the list members'
      method.http_method = 'DELETE'
      method.uri = '/lists/:list_id/tag/:tag'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the list's ID"
      end

      method.parameter('tag') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the name of the tag to use'
      end
    end
  end
end

class ApiSpec::Spec

  endpoint 'People' do |people|

    people.method('Index') do |method|
      method.synopsis = "Returns a list of people"
      method.http_method = "GET"
      method.uri = "/people"

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

    people.method('Show') do |method|
      method.synopsis = "Returns a full representation of the person"
      method.http_method = "GET"
      method.uri = "/people/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'int'
        p.description = 'the person\'s id'
      end
    end

    people.method('Match') do |method|
      method.synopsis = "Finds people that match certain attributes exactly"
      method.http_method = "GET"
      method.uri = "/people/match"

      method.parameter("email") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("first_name") do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'deprecated'
      end

      method.parameter("last_name") do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'deprecated'
      end

      method.parameter("phone") do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'deprecated'
      end

      method.parameter("mobile") do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'deprecated'
      end

    end

    people.method('Search') do |method|
      method.synopsis = "Search for people using non-unique traits"
      method.http_method = "GET"
      method.uri = "/people/search"

      method.parameter("first_name") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("last_name") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("city") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("state") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("sex") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("birthdate") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("updated_since") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("with_mobile") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter("custom_values") do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('civicrm_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('county_file_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('datatrust_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('dw_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('external_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('media_market_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('membership_level_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('ngp_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('pf_strat_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('rnc_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('rnc_regid') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('salesforce_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('state_file_id') do |p|
        p.required = 'N'
        p.type = 'string'
      end

      method.parameter('van_id') do |p|
        p.required = 'N'
        p.type = 'string'
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

    people.method('Nearby') do |method|
      method.synopsis = "Searches for people near a location defined by latitude and longitude"
      method.http_method = "GET"
      method.uri = "/people/nearby"

      method.parameter('location') do |p|
        p.required = 'Y'
        p.default = '34.049031,-118.251399'
        p.type = 'string'
        p.description = 'origin of search in the format "latitude,longitude"'
      end

      method.parameter('distance') do |p|
        p.required = 'N'
        p.default = '1'
        p.type = 'int'
        p.description = 'radius in miles for which to include results'
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

    people.method('Me') do |method|
      method.synopsis = "Returns the access token's resource owner's representation"
      method.http_method = "GET"
      method.uri = "/people/me"
    end

    people.method('Register') do |method|
      method.synopsis = "Starts user registration person for the given person"
      method.http_method = "GET"
      method.uri = "/people/:id/register"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The person's ID"
      end
    end

    people.method('Taggings') do |method|
      method.synopsis = "Returns all taggings for a given person"
      method.http_method = "GET"
      method.uri = "/people/:id/taggings"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person'
      end
    end

    people.method('Tag Person') do |method|
      method.synopsis = "Tags a person"
      method.http_method = "PUT"
      method.uri = "/people/:id/taggings"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON with tagging information'
      end
    end

    people.method('Tag Removal') do |method|
      method.synopsis = "Removes a tag from a person"
      method.http_method = "DELETE"
      method.uri = "/people/:id/taggings/:tag"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person'
      end

      method.parameter('tag') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the name of the tag'
      end

    end

    people.method('Bulk Tag Removal') do |method|
      method.synopsis = "Removes tags from a person"
      method.http_method = "DELETE"
      method.uri = "/people/:id/taggings"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'the tagging resource'
      end
    end

    people.method('Political Capital') do |method|
      method.synopsis = "Returns a paginated list of a person's capitals"
      method.http_method = "GET"
      method.uri = "/people/:id/capitals"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the ID of the person"
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

    people.method('Political Capital Create') do |method|
      method.synopsis = "Creates capital for the given person"
      method.http_method = "POST"
      method.uri = "/people/:id/capitals"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the ID of the person"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON representation of the capital to create'
      end
    end

    people.method('Political Capital Destroy') do |method|
      method.synopsis = "Destroys capital for a person"
      method.http_method = "DELETE"
      method.uri = "/people/:person_id/capitals/:capital_id"

      method.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the person'
      end

      method.parameter('capital_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the capital to destroy'
      end
    end

    people.method('Create') do |method|
      method.synopsis = "Creates a person with the provided data"
      method.http_method = "POST"
      method.uri = "/people"

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON representation of the person to create'
      end
    end

    people.method('Update') do |method|
      method.synopsis = "Updates a person with the provided data"
      method.http_method = "PUT"
      method.uri = "/people/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The person's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating the person'
      end
    end

    people.method('Push') do |method|
      method.synopsis = "Updates a matched person or creates a new one if the person doesn't exist"
      method.http_method = "PUT"
      method.uri = "/people/push"

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating/matching the person'
      end
    end

    people.method('Add') do |method|
      method.synopsis = "Updates a matched person (without overriding data) or creates a new one if the person doesn't exist"
      method.http_method = "PUT"
      method.uri = "/people/add"

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating/matching the person'
      end
    end

    people.method('Destroy') do |method|
      method.synopsis = "Removes the person with the matching ID"
      method.http_method = "DELETE"
      method.uri = "/people/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The person's ID"
      end
    end

    people.method('Private Note Create') do |method|
      method.synopsis = "Creates a private note for the given person"
      method.http_method = "POST"
      method.uri = "/people/:id/notes"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "the ID of the person"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON representation of the note to create'
      end
    end

  end

end

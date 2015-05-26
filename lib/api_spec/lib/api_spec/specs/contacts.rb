class ApiSpec::Spec

  endpoint 'Contacts' do |c|

    c.method('Index') do |m|

      m.synopsis = "View a paginated list of a person's contacts"
      m.http_method = "GET"
      m.uri = "/people/:person_id/contacts"

      m.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the person\'s ID'
      end

      m.parameter('__token') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination token'
      end

      m.parameter('__nonce') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination nonce'
      end

      m.parameter('limit') do |p|
        p.required = 'N'
        p.default = '10'
        p.type = 'int'
        p.description = 'maximum number of results to return'
      end

    end

    c.method('Create') do |m|

      m.synopsis = "Record a contact for a person"
      m.http_method = "POST"
      m.uri = "/people/:person_id/contacts"

      m.parameter('person_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the person\'s ID'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the new contact'
      end

    end

  end

  endpoint 'Contact Types' do |c|

    c.method('Index') do |m|

      m.synopsis = "Returns paginated list of nation-defined contact types"
      m.http_method = "GET"
      m.uri = "/settings/contact_types"

      m.parameter('__token') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination token'
      end

      m.parameter('__nonce') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'pagination nonce'
      end

      m.parameter('limit') do |p|
        p.required = 'N'
        p.default = '10'
        p.type = 'int'
        p.description = 'maximum number of results to return'
      end

    end

    c.method('Create') do |m|

      m.synopsis = "Creates a new contact type"
      m.http_method = "POST"
      m.uri = "/settings/contact_types"

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the new contact type'
      end

    end

    c.method('Update') do |m|

      m.synopsis = "Updates an existing contact type"
      m.http_method = "PUT"
      m.uri = "/settings/contact_types/:id"

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the existing contact type'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the updates to make'
      end

    end

    c.method('Destroy') do |m|

      m.synopsis = "Destroys a contact type"
      m.http_method = "DELETE"
      m.uri = "/settings/contact_types/:id"

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the existing contact type'
      end

    end

    c.method('List Methods') do |m|

      m.synopsis = "Lists all contact methods"
      m.http_method = "GET"
      m.uri = "/settings/contact_methods"

    end

    c.method('List Statuses') do |m|

      m.synopsis = "Lists all contact status types"
      m.http_method = "GET"
      m.uri = "/settings/contact_statuses"

    end

  end

end

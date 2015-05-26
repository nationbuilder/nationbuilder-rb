class ApiSpec::Spec

  endpoint 'Donations' do |donation|

    donation.method('Index') do |method|
      method.synopsis = "Returns a list of donations"
      method.http_method = "GET"
      method.uri = "/donations"

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

    donation.method('Create') do |method|
      method.synopsis = "Creates a donation with the provided data"
      method.http_method = "POST"
      method.uri = "/donations"

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON representation of a donation'
      end
    end

    donation.method('Update') do |method|
      method.synopsis = "Updates a donation with the provided data"
      method.http_method = "PUT"
      method.uri = "/donations/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The donation's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating the donation'
      end
    end

    donation.method('Destroy') do |method|
      method.synopsis = "Removes the donation with the matching ID"
      method.http_method = "DELETE"
      method.uri = "/donations/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The donation's ID"
      end
    end

  end

end

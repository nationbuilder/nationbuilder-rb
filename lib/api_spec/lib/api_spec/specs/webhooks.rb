class ApiSpec::Spec

  endpoint 'Webhooks' do |surveys|

    surveys.method('Index') do |m|

      m.synopsis = "Lists all webhooks"
      m.http_method = "GET"
      m.uri = "/webhooks"

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

    surveys.method('Show') do |m|

      m.synopsis = "Shows the details of an individual webhook"
      m.http_method = "GET"
      m.uri = "/webhooks/:id"

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the ID of the webhook to display'
      end

    end

    surveys.method('Create') do |m|
      m.synopsis = "Creates a new webhook"
      m.http_method = "POST"
      m.uri = "/webhooks"

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the new webhook'
      end
    end

    surveys.method('Destroy') do |m|

      m.synopsis = "Destroys a webhook"
      m.http_method = "DELETE"
      m.uri = "/webhooks/:id"

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID a webhook'
      end

    end

  end


end

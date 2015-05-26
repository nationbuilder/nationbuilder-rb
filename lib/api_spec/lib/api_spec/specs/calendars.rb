class ApiSpec::Spec

  endpoint 'Calendars' do |bp|

    bp.method('Index') do |m|

      m.synopsis = "Shows a list of calendars"
      m.http_method = "GET"
      m.uri = "/sites/:site_slug/pages/calendars"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the calendars'
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

    bp.method('Show') do |m|

      m.synopsis = "Show the details of a calendar"
      m.http_method = "GET"
      m.uri = "/sites/:site_slug/pages/calendars/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the calendar'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the calendar'
      end

    end

    bp.method('Create') do |m|

      m.synopsis = "Creates a new calendar"
      m.http_method = "POST"
      m.uri = "/sites/:site_slug/pages/calendars"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the calendar'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'json'
        p.description = 'a JSON representation of the new calendar'
      end

    end

    bp.method('Update') do |m|

      m.synopsis = "Updates the attributes of a calendar"
      m.http_method = "PUT"
      m.uri = "/sites/:site_slug/pages/calendars/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the calendar'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the calendar'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'json'
        p.description = 'JSON containing updates'
      end

    end

    bp.method('Destroy') do |m|

      m.synopsis = "Removes a calendar"
      m.http_method = "DELETE"
      m.uri = "/sites/:site_slug/pages/calendars/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the calendar'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the calendar'
      end

    end

  end

end

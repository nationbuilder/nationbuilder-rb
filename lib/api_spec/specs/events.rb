class ApiSpec::Spec

  endpoint 'Events' do |event|

    event.method('Index') do |method|
      method.synopsis = "Returns a list of events"
      method.http_method = "GET"
      method.uri = "/sites/:site_slug/pages/events"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
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

      method.parameter('tags') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'tags that must be present on the event'
      end

      method.parameter('starting') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'earliest starting time'
      end

      method.parameter('until') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'latest ending time'
      end

      method.parameter('calendar_id') do |p|
        p.required = 'N'
        p.type = 'int'
        p.description = 'the ID of the calendar from which events should be scoped'
      end

    end

    event.method('Show') do |method|
      method.synopsis = "Returns an event"
      method.http_method = "GET"
      method.uri = "/sites/:site_slug/pages/events/:id"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the event'
      end

    end

    event.method('Create') do |method|
      method.synopsis = "Creates a event with the provided data"
      method.http_method = "POST"
      method.uri = "/sites/:site_slug/pages/events"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON representation of a event'
      end
    end

    event.method('Update') do |method|
      method.synopsis = "Updates a event with the provided data"
      method.http_method = "PUT"
      method.uri = "/sites/:site_slug/pages/events/:id"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The event's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'JSON attributes for updating the event'
      end
    end

    event.method('Destroy') do |method|
      method.synopsis = "Removes the event with the matching ID"
      method.http_method = "DELETE"
      method.uri = "/sites/:site_slug/pages/events/:id"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The event's ID"
      end
    end

    event.method('RSVPs') do |method|
      method.synopsis = "Lists all RSVPs for an event"
      method.http_method = "GET"
      method.uri = "/sites/:site_slug/pages/events/:id/rsvps"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The event's ID"
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

    event.method('RSVP Create') do |method|
      method.synopsis = "Creates an RSVP for an event"
      method.http_method = "POST"
      method.uri = "/sites/:site_slug/pages/events/:id/rsvps"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The event's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'A JSON representation of the new post'
      end

    end

    event.method('RSVP Update') do |method|
      method.synopsis = "Updates an existing RSVP"
      method.http_method = "PUT"
      method.uri = "/sites/:site_slug/pages/events/:event_id/rsvps/:rsvp_id"

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the event'
      end

      method.parameter('event_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The event's ID"
      end

      method.parameter('rsvp_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = "The RSVP's ID"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON attributes for updating the RSVP'
      end

    end

  end

end

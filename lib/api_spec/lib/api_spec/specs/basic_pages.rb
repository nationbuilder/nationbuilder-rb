class ApiSpec::Spec

  endpoint 'Basic Pages' do |bp|

    bp.method('Index') do |m|

      m.synopsis = "Shows a list of the basic pages in the system"
      m.http_method = "GET"
      m.uri = "/sites/:site_slug/pages/basic_pages"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the basic page'
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

    bp.method('Create') do |m|

      m.synopsis = "Creates a basic page for a site"
      m.http_method = "POST"
      m.uri = "/sites/:site_slug/pages/basic_pages"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the basic page'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the new basic page'
      end

    end

    bp.method('Update') do |m|

      m.synopsis = "Updates the attributes of a basic page"
      m.http_method = "PUT"
      m.uri = "/sites/:site_slug/pages/basic_pages/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the basic page'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the basic page'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON containing updates'
      end

    end

    bp.method('Destroy') do |m|

      m.synopsis = "Removes a basic page"
      m.http_method = "DELETE"
      m.uri = "/sites/:site_slug/pages/basic_pages/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the basic page'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the basic page'
      end

    end

  end

end

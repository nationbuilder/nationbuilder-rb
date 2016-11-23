class ApiSpec::Spec

  endpoint 'Page Attachments' do |pa|

    pa.method('Index') do |method|
      method.synopsis = "Returns a list of a page's file attachments"
      method.http_method = 'GET'
      method.uri = '/sites/:site_slug/pages/:page_slug/attachments'

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the slug of the site the page lives on'
      end

      method.parameter('page_slug') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'string'
        p.description = "the page's slug"
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

    pa.method('Show') do |method|
      method.synopsis = 'Returns the details of the file attachment for a page'
      method.http_method = 'GET'
      method.uri = '/sites/:site_slug/pages/:page_slug/attachments/:id'

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the slug of the site the page lives on'
      end

      method.parameter('page_slug') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'string'
        p.description = "the page's slug"
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the page attachment'
      end
    end

    pa.method('Create') do |method|
      method.synopsis = 'Creates a new file attachment for a page'
      method.http_method = 'POST'
      method.uri = '/sites/:site_slug/pages/:page_slug/attachments'

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the slug of the site the page lives on'
      end

      method.parameter('page_slug') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'string'
        p.description = "the page's slug"
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.default = '{}'
        p.type = 'json'
        p.description = 'a JSON representation of the attachment'
      end
    end

    pa.method('Destroy') do |method|
      method.synopsis = 'Destroys a file attachment for a page'
      method.http_method = 'DELETE'
      method.uri = '/sites/:site_slug/pages/:page_slug/attachments/:id'

      method.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the slug of the site the page lives on'
      end

      method.parameter('page_slug') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'string'
        p.description = "the page's slug"
      end

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the page attachment'
      end
    end
  end
end

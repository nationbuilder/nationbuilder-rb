class ApiSpec::Spec

  endpoint 'Blog Posts' do |bp|

    bp.method('Index') do |m|
      m.synopsis = 'Shows a list of posts for a blog'
      m.http_method = 'GET'
      m.uri = '/sites/:site_slug/pages/blogs/:id/posts'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
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

    bp.method('Match') do |m|
      m.synopsis = 'Find a blog post by its external id'
      m.http_method = 'GET'
      m.uri = '/sites/:site_slug/pages/blogs/:id/match'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
      end

      m.parameter('external_id') do |p|
        p.required = 'N'
        p.default = '1'
        p.type = 'int'
        p.description = 'the external id of the blog post'
      end
    end

    bp.method('Show') do |m|
      m.synopsis = 'Show the details of a blog post'
      m.http_method = 'GET'
      m.uri = '/sites/:site_slug/pages/blogs/:blog_id/posts/:blog_post_id'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('blog_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
      end

      m.parameter('blog_post_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog post'
      end
    end

    bp.method('Create') do |m|
      m.synopsis = 'Creates a new blog post'
      m.http_method = 'POST'
      m.uri = '/sites/:site_slug/pages/blogs/:blog_id/posts'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('blog_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'json'
        p.description = 'a JSON representation of the new post'
      end
    end

    bp.method('Update') do |m|
      m.synopsis = 'Updates the attributes of a blog post'
      m.http_method = 'PUT'
      m.uri = '/sites/:site_slug/pages/blogs/:blog_id/posts/:blog_post_id'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('blog_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
      end

      m.parameter('blog_post_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog post'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.default = '1'
        p.type = 'json'
        p.description = 'JSON containing updates'
      end
    end

    bp.method('Destroy') do |m|
      m.synopsis = 'Removes a blog post'
      m.http_method = 'DELETE'
      m.uri = '/sites/:site_slug/pages/blogs/:blog_id/posts/:blog_post_id'

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the blog'
      end

      m.parameter('blog_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog'
      end

      m.parameter('blog_post_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the blog post'
      end
    end
  end
end

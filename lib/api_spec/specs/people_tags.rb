class ApiSpec::Spec

  endpoint 'People Tags' do |tags|

    tags.method('Index') do |method|
      method.synopsis = 'Returns a list of previously used tags'
      method.http_method = 'GET'
      method.uri = '/tags'

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

    tags.method('People') do |method|
      method.synopsis = 'Searches for people with the given tag'
      method.http_method = 'GET'
      method.uri = '/tags/:tag/people'

      method.parameter('tag') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the name of the tag'
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
  end
end

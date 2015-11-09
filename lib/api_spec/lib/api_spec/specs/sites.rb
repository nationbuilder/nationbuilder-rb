class ApiSpec::Spec

  endpoint 'Sites' do |tags|

    tags.method('Index') do |method|
      method.synopsis = 'Returns a list of all sites'
      method.http_method = 'GET'
      method.uri = '/sites'

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

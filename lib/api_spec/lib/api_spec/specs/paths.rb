class ApiSpec::Spec

  endpoint 'Paths' do |paths|

    paths.method('Index') do |method|
      method.synopsis = 'Returns a list of paths and path steps'
      method.http_method = 'GET'
      method.uri = '/paths'

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

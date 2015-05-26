class ApiSpec::Spec

  endpoint 'Surveys' do |surveys|

    surveys.method('Index') do |m|

      m.synopsis = "Shows a list of all surveys for the a site"
      m.http_method = "GET"
      m.uri = "/sites/:site_slug/pages/surveys"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the survey'
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

    surveys.method('Create') do |m|

      m.synopsis = "Creates a survey for a site"
      m.http_method = "POST"
      m.uri = "/sites/:site_slug/pages/surveys"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the survey'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the new survey'
      end

    end

    surveys.method('Update') do |m|

      m.synopsis = "Updates the attributes of a survey"
      m.http_method = "PUT"
      m.uri = "/sites/:site_slug/pages/surveys/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the survey'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the survey'
      end

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON containing updates'
      end

    end

    surveys.method('Destroy') do |m|

      m.synopsis = "Removes a survey"
      m.http_method = "DELETE"
      m.uri = "/sites/:site_slug/pages/surveys/:id"

      m.parameter('site_slug') do |p|
        p.required = 'Y'
        p.type = 'string'
        p.description = 'the site holding the survey'
      end

      m.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the survey'
      end

    end

  end

end

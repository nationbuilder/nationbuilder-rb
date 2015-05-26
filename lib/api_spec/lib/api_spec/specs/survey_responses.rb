class ApiSpec::Spec

  endpoint 'Survey Responses' do |surveys|

    surveys.method('Index') do |m|

      m.synopsis = "Lists all survey responses"
      m.http_method = "GET"
      m.uri = "/survey_responses"

      m.parameter('start_time') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'the starting time for results'
      end

      m.parameter('end_time') do |p|
        p.required = 'N'
        p.type = 'string'
        p.description = 'the ending time for results'
      end

      m.parameter('survey_id') do |p|
        p.required = 'N'
        p.type = 'int'
        p.description = 'the id for a parent survey'
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
      m.synopsis = "Creates responses for a survey"
      m.http_method = "POST"
      m.uri = "/survey_responses"

      m.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'a JSON representation of the survey responses'
      end
    end
  end


end

class ApiSpec::Spec

  endpoint 'Campaign Data' do |bp|

    bp.method('Show') do |m|

      m.synopsis = "Shows campaign metadata about the nation"
      m.http_method = "GET"
      m.uri = "/campaign_data"

    end

  end

end

class ApiSpec::Spec

  endpoint 'Exports' do |export|

    export.method('Create List') do |method|
      method.synopsis = "Creates a list export with the provided data"
      method.http_method = "POST"
      method.uri = "/list/:list_id/exports"

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON representation of the export'
      end
    end

    export.method('Show') do |method|
      method.synopsis = "Shows the status of a list export."
      method.http_method = "GET"
      method.uri = "/exports/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the export'
      end
    end

    export.method('Delete') do |method|
      method.synopsis = "Delete the export"
      method.http_method = "DELETE"
      method.uri = "/exports/:id"

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the export'
      end
    end
  end

end

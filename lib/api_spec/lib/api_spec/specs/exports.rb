class ApiSpec::Spec

  endpoint 'Exports' do |export|

    export.method('Export List') do |method|
      method.synopsis = 'Starts an export of a list'
      method.http_method = 'POST'
      method.uri = '/lists/:list_id/exports'

      method.parameter('list_id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'ID of the list to export'
      end

      method.parameter('body') do |p|
        p.required = 'Y'
        p.type = 'json'
        p.description = 'JSON representation of the export'
      end
    end

    export.method('Show') do |method|
      method.synopsis = 'Shows the status of a list export.'
      method.http_method = 'GET'
      method.uri = '/exports/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the export'
      end
    end

    export.method('Delete') do |method|
      method.synopsis = 'Delete the export'
      method.http_method = 'DELETE'
      method.uri = '/exports/:id'

      method.parameter('id') do |p|
        p.required = 'Y'
        p.type = 'int'
        p.description = 'the ID of the export'
      end
    end
  end
end

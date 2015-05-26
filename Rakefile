$LOAD_PATH << 'lib'
$LOAD_PATH << 'lib/api_spec'

task :generate_spec do
  require 'api_spec'
  ApiSpec::Spec.write_spec('spec.json')
end

task :default => [:generate_spec]

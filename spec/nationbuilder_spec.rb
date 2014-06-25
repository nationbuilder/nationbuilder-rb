require 'spec_helper'

describe 'integration' do

  it 'should work' do
    client = NationBuilder::Client.new('asdf',
                                       'asdfasdf')
    puts 'endpoints:'
    puts client.endpoints
    puts
    puts 'blog methods:'
    puts client[:blogs].methods
    puts
    puts 'index parameters:'
    puts client[:blogs][:index].parameters
    puts
    puts 'index url:'
    response = client.call(:people, :index)
    puts response.code
    puts response.body
  end

end

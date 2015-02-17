require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '53920a524356034a065515a37650df2bd295971975d5742b9daa50eb8c7404d5')
  end

  describe '#endpoints' do

    it 'should contain all defined endpoints' do
      client.endpoints.sort.should eq([
        :basic_pages,
        :blog_posts,
        :blogs,
        :calendars,
        :campaign_data,
        :contact_types,
        :contacts,
        :donations,
        :events,
        :exports,
        :imports,
        :lists,
        :memberships,
        :page_attachments,
        :people,
        :people_tags,
        :sites,
        :survey_responses,
        :surveys,
        :webhooks
      ])
    end
  end

  describe '#base_url' do

    it 'should contain the nation slug' do
      client.base_url.should eq('https://organizeralexandreschmitt.nationbuilder.com')
    end
  end

  describe '#call' do

    it 'should handle a parametered GET' do
      VCR.use_cassette('parametered_get') do
        response = client.call(:basic_pages, :index, site_slug: 'organizeralexandreschmitt')
        response['results'].each do |result|
          result['site_slug'].should eq('organizeralexandreschmitt')
        end
      end
    end

    it 'should handle a parametered POST' do
      params = {
        person: {
          email: 'bob@example.com',
          last_name: 'Smith',
          first_name: 'Bob'
        }
      }

      response = VCR.use_cassette('parametered_post') do
        client.call(:people, :create, params)
      end

      response['person']['first_name'].should eq('Bob')
    end

    it 'should handle a DELETE' do
      params = {
        id: 21234
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      response.should eq({})
    end
  end

  describe 'with fire_webhooks parameter passed to constructor' do

    let(:client) do
      NationBuilder::Client.new('organizeralexandreschmitt',
                                '53920a524356034a065515a37650df2bd295971975d5742b9daa50eb8c7404d5',
                                fire_webhooks: false)
    end

    it 'should pass it as a query parameter on API calls' do
      params = {
        person: {
          email: 'bob@example.com',
          last_name: 'Smith',
          first_name: 'Bob'
        }
      }

      VCR.use_cassette('parametered_post_with_fire_webhooks_false') do
        client.call(:people, :create, params)
      end
    end
  end
end

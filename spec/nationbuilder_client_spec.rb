require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('dh',
                              '6ed3ab9395daf0e3e39098761e85e8e703aa84921c5c1e32637f6984944cf1f2')
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
      client.base_url.should eq('https://dh.nationbuilder.com')
    end

  end

  describe '#call' do

    it 'should handle a parametered GET' do
      VCR.use_cassette('parametered_get') do
        response = client.call(:basic_pages, :index, site_slug: 'dh')
        response['results'].each do |result|
          result['site_slug'].should eq('dh')
        end
      end
    end

    it 'should handle a parametered POST' do
      params = {
        person: {
          email: "bob@example.com",
          last_name: "Smith",
          first_name: "Bob"
        }
      }

      response = VCR.use_cassette('parametered_post') do
        client.call(:people, :create, params)
      end

      response['person']['first_name'].should eq('Bob')
    end

    it 'should handle a DELETE' do
      params = {
        id: 24,
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      response.should eq({})
    end

  end

end

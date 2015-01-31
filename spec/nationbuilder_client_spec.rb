require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '07c3200badad9727d29fd2bcde566a211b05e05b92680ca0439504084452db9a')
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
        id: 275446,
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      response.should eq({})
    end
  end

  describe '#pagination' do

    before do
      VCR.use_cassette('parametered_get') do
        client.call(:basic_pages, :index, site_slug: 'organizeralexandreschmitt')
      end
    end

    it 'should check for next and prev page link' do
      client.next?.should eq(true)
      client.prev?.should eq(false)
    end

    it 'should return next page' do
      response = VCR.use_cassette('next') { client.next }
      response.should include('results')
    end

    it 'should return nil if no prev page' do
      client.prev.should be_nil
    end

  end
end

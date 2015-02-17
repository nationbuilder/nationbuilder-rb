require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '53920a524356034a065515a37650df2bd295971975d5742b9daa50eb8c7404d5')
  end

  describe '#endpoints' do

    it 'should contain all defined endpoints' do
      expect(client.endpoints.sort).to eq([
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
      expect(client.base_url).to eq('https://organizeralexandreschmitt.nationbuilder.com')
    end
  end

  describe '#call' do

    it 'should handle a parametered GET' do
      VCR.use_cassette('parametered_get') do
        response = client.call(:basic_pages, :index, site_slug: 'organizeralexandreschmitt')
        response['results'].each do |result|
          expect(result['site_slug']).to eq('organizeralexandreschmitt')
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

      expect(response['person']['first_name']).to eq('Bob')
    end

    it 'should handle a DELETE' do
      params = {
        id: 21234
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      expect(response).to eq(nil)
    end
  end

  describe '#classify_response_error' do
    it 'should account for rate limits' do
      response = double(code: 429, body: 'rate limiting')
      expect(client.classify_response_error(response).class).
        to eq(NationBuilder::RateLimitedError)
    end
    it 'should account for client errors' do
      response = double(code: 404, body: '404ing')
      expect(client.classify_response_error(response).class).
        to eq(NationBuilder::ClientError)
    end
    it 'should account for client errors' do
      response = double(code: 500, body: '500ing')
      expect(client.classify_response_error(response).class).
        to eq(NationBuilder::ServerError)
    end
  end
end

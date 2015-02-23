require 'spec_helper'

describe NationBuilder::Client do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '53920a524356034a065515a37650df2bd295971975d5742b9daa50eb8c7404d5',
                              retries: 1)
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

    context 'fire_webhooks' do

      it 'should disable webhooks' do
        params = {
          fire_webhooks: false,
          person: {
            email: 'bob@example.com',
            last_name: 'Smith',
            first_name: 'Bob'
          }
        }

        expect(client).to receive(:perform_request_with_retries) do |_, _, request_args|
          expect(request_args[:query][:fire_webhooks]).to be_falsey
        end

        client.call(:people, :create, params)
      end

      it 'should not be included if not specified' do
        params = {
          person: {
            email: 'bob@example.com',
            last_name: 'Smith',
            first_name: 'Bob'
          }
        }

        expect(client).to receive(:perform_request_with_retries) do |_, _, request_args|
          expect(request_args[:query].include?(:fire_webhooks)).to be_falsey
        end

        client.call(:people, :create, params)
      end

    end

    it 'should handle a DELETE' do
      params = {
        id: 21234
      }

      response = VCR.use_cassette('delete') do
        client.call(:people, :destroy, params)
      end

      expect(response).to eq(true)
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

  describe '#perform_request_with_retries' do
    before do
      expect(HTTPClient).to receive(:send)
    end

    it 'should raise non-rate limiting execeptions' do
      expect(client).to receive(:parse_response_body) { raise StandardError.new('boom') }
      expect do
        client.perform_request_with_retries(nil, nil, nil)
      end.to raise_error
    end

    it 'should return a response if the rate limit is eventually dropped' do
      expect(Kernel).to receive(:sleep).twice
      allow(client).to receive(:parse_response_body) do
        @count ||= 0
        if @count != 2
          raise NationBuilder::RateLimitedError.new
        end
      end
      expect do
        client.perform_request_with_retries(nil, nil, nil)
      end.to_not raise_error
    end
  end
end

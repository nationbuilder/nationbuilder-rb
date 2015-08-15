require 'spec_helper'

describe NationBuilder::Paginator do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '3695ca30a6e74401115ec2b68767b53112c32b5bedc3c1f34e72c9749419b2de')
  end
  let(:response) do
    VCR.use_cassette('parametered_get') do
      client.call(:basic_pages, :index, site_slug: 'organizeralexandreschmitt', limit: 11)
    end
  end

  describe '#pagination' do
    before do
      @page1 = NationBuilder::Paginator.new(client, response)
      @page2 = VCR.use_cassette('paginated_get_page2') { @page1.next }
    end

    it 'should check for next and prev page link' do
      expect(@page1.next?).to_not be_nil
      expect(@page1.prev?).to be_nil
    end

    it 'should return next page' do
      VCR.use_cassette('paginated_get_page2') do
        page2 = @page1.next
        expect(page2.body).to_not eq(@page1.body)
      end
    end

    it 'should return additional pages' do
      VCR.use_cassette('paginated_get_page3') do
        page3 = @page2.next
        expect(page3.body).to_not eq(@page2.body)
      end
    end

    it 'should return nil if no prev page' do
      expect(@page1.prev).to be_nil
    end

    it 'should accept limit params and return results accordingly' do
      VCR.use_cassette('paginated_get_page2_with_limit') do
        expect(@page1.body['results'].count).to eq(11)
        page2 = @page1.next(limit: 5)
        expect(page2.body['results'].count).to eq(5)
      end
    end

    it 'defaults to original limit when none is given' do
      VCR.use_cassette('paginated_get_page2') do
        page2 = @page1.next
        expect(page2.body['results'].count).to eq(11)
      end
    end
  end
end

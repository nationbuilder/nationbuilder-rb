require 'spec_helper'

describe NationBuilder::Paginator do

  let(:client) do
    NationBuilder::Client.new('organizeralexandreschmitt',
                              '53920a524356034a065515a37650df2bd295971975d5742b9daa50eb8c7404d5')
  end
  let(:response) do
    VCR.use_cassette('parametered_get') do
      client.call(:basic_pages, :index, site_slug: 'organizeralexandreschmitt')
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
  end
end

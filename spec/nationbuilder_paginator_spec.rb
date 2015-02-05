require 'spec_helper'

describe Paginator do

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
      @page1 = Paginator.new(client, response)
      @page2 = VCR.use_cassette('paginated_get_page2') { @page1.next }
    end

    it 'should check for next and prev page link' do
      @page1.next?.should_not be_nil
      @page1.prev?.should be_nil
    end

    it 'should return next page' do
      VCR.use_cassette('paginated_get_page2') do
        page2 = @page1.next
        page2.body.should_not eq(@page1.body)
      end
    end

    it 'should return additional pages' do
      VCR.use_cassette('paginated_get_page3') do
        page3 = @page2.next
        page3.body.should_not eq(@page2.body)
      end
    end

    it 'should return nil if no prev page' do
      @page1.prev.should be_nil
    end
  end
end
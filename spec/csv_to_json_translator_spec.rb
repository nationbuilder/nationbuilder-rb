require 'nationbuilder/csv_to_json_translator'

describe CSVToJSONTranslator do
  describe 'translate' do
    let(:csv_file) { 'spec/fixtures/sample.csv' }

    it 'yields each row as API-ready json' do
      expect { |b| CSVToJSONTranslator.new(csv_file).translate(&b) }
        .to yield_successive_args({ emails: ['1thomas@prodigy.net'] }.to_json,
                                  { emails: ['2226helen.1403@juno.com'] }.to_json)
    end
  end
end

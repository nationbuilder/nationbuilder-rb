require 'csv'

class CSVToJSONTranslator
  def initialize(csv)
    @csv = csv
  end

  def translate
    CSV.foreach(@csv, headers: :first_row) do |row|
      yield ({ emails: [row['email1']] }).to_json
    end
  end
end

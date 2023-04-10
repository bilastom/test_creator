require './lib/csv_parser'

describe CsvParser do
  subject(:service_call) { CsvParser.new('file.csv').call }
  let(:csv_path) { './spec/fixtures/file.csv' }

  before do 
    allow(File).to receive(:expand_path).and_return(csv_path)
  end

  it 'parse CSV file' do
    expect(service_call).to eq [['Question1', 'Answer1'], ['Question2', 'Answer2'], ['Question3', 'Answer3']]
  end
end

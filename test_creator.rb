require './lib/csv_parser'
require './lib/pdf_table_creator'

class TestCreator
  def initialize(path, with_answers: true, shuffle: true, landscape_layout: false )
    @path = path
    @with_answers = with_answers
    @shuffle = shuffle
    @landscape_layout = landscape_layout
  end

  def call
    PdfTableCreator.new(output_file_name, input_data, @landscape_layout).generate
  end

  private

  attr_reader :path, :with_answers, :shuffle

  def input_data
    input_data = parsed_csv.map { |row| with_answers ? row : [row[0], ''] }
    shuffle ? input_data.shuffle : input_data
  end

  def output_file_name
    timestamp = Time.now.strftime("%Y%m%d%H%M")
    File.expand_path("../output/#{timestamp}_output.pdf", __FILE__)
  end

  def parsed_csv
    @pared_csv ||= CsvParser.new(path).call.shuffle
  end
end

# script execution
TestCreator.new('english/unit4.csv', with_answers: false, landscape_layout: true).call
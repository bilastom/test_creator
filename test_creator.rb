require 'prawn/table'
require 'pry'
require './lib/csv_parser'

class TestCreator
  FONT_PATH = 'assets/fonts/Roboto'.freeze
  FONT_FAMILY = { 'Roboto' => {
    normal: File.expand_path("../#{FONT_PATH}/Roboto-Regular.ttf", __FILE__),
    italic: File.expand_path("../#{FONT_PATH}/Roboto-Italic.ttf", __FILE__),
    bold: File.expand_path("../#{FONT_PATH}/Roboto-Bold.ttf", __FILE__),
    bold_italic: File.expand_path("../#{FONT_PATH}/Roboto-BoldItalic.ttf", __FILE__)
  }}
  OUTPUT_DIR = File.expand_path('../output', __FILE__)

  def initialize(path, with_answers: true, shuffle: true )
    @path = path
    @with_answers = with_answers
    @shuffle = shuffle
  end

  def call
    generate(prepare_input_data)
  end

  private

  attr_reader :path, :with_answers, :shuffle

  def prepare_input_data
    input_data = []
    if with_answers
      input_data = parsed_csv
    else
      input_data = parsed_csv.map { |row| [row[0], ''] }
    end
    return input_data.shuffle if shuffle

    input_data
  end

  def generate(input_data)
    Prawn::Document.generate(
      output_file_name, 
      page_size: 'A4', 
      page_layout: :landscape
    ) do |pdf|
      pdf.font_families.update(FONT_FAMILY)

      pdf.font('Roboto') do
        pdf.table(input_data, width: 756, cell_style: {
          e: :bold, size: 15
        }) do
          column(0).style(width: 300)
        end
      end
    end
  end

  def output_file_name
    timestamp = Time.now.strftime("%Y%m%d%H%M")

    File.expand_path("../output/#{timestamp}_output.pdf", __FILE__)
  end

  def parsed_csv
    @pared_csv ||= CsvParser.new(path).call.shuffle
  end
end

TestCreator.new('english/unit4.csv', with_answers: false).call
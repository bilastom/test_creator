require 'prawn'
require 'prawn/table'

class PdfTableCreator < Prawn::Document
  FONT_PATH = 'assets/fonts/Roboto'.freeze
  FONT_FAMILY = {
    'Roboto' => {
      normal: File.expand_path("../../#{FONT_PATH}/Roboto-Regular.ttf", __FILE__),
      italic: File.expand_path("../../#{FONT_PATH}/Roboto-Italic.ttf", __FILE__),
      bold: File.expand_path("../../#{FONT_PATH}/Roboto-Bold.ttf", __FILE__),
      bold_italic: File.expand_path("../../#{FONT_PATH}/Roboto-BoldItalic.ttf", __FILE__)
    }
  }

  def initialize(output_file_name, input_data, landscape = false)
    page_layout = landscape ? :landscape : :portrait
    super(page_size: 'A4', page_layout: page_layout)
    @output_file_name = output_file_name
    @input_data = input_data
  end

  def generate
    font_families.update(FONT_FAMILY)
    font('Roboto') do
      table(@input_data, width: 756, cell_style: { e: :bold, size: 15 }) do
        column(0).style(width: 300)
      end
    end
    render_file(@output_file_name)
  end
end

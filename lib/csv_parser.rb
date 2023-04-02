require 'csv'

class CsvParser
  def initialize(path)
    @path = path
  end

  def call
    file_path = "../../source/#{@path}"
    expanded_path = File.expand_path(file_path, __FILE__)

    [].tap do |result|
      CSV.foreach(expanded_path, col_sep: ';') do |row|
        result << row  
      end
    end
  end
end

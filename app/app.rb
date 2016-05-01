require './app/input/file_parser'
require './app/collections/student'
require './app/output/sorter'
require './app/output/Outputter'
require './lib/file_parser_instructions'

class App
  include FileParserInstructions

  def parse_records
    MAPPER.map do |name, data|
      lines     = FileParser.new(data[:path]).split_by(data[:delimiter])
      students  = build_students(lines, data[:order])
    end.flatten
  end

  private

  def build_students(lines, order)
    lines.map do |line|
      attrs = Student.build_attrs(line, order)
      Student.new(attrs)
    end
  end
end

student_collection = App.new.parse_records
sorter = Sorter.new(student_collection)

$stdout.puts 'Output 1:'
sorted = sorter.sort_by(:campus, :last_name)
Outputter.new(sorted).output
$stdout.puts

$stdout.puts 'Output 2:'
sorted = sorter.sort_by_date_of_birth
Outputter.new(sorted).output
$stdout.puts

$stdout.puts 'Output 3:'
sorted = sorter.sort_by_desc(:last_name)
Outputter.new(sorted).output

# frozen_string_literal: true
require './app/input/file_parser'
require './app/collections/student'
require './app/output/sorter'
require './app/output/Outputter'
require './lib/file_parser_instructions'

## Input
# Parse records from txt files located in ./data.
# Pass file paths to FileParser.
# Parsing instruction (meta data about each file)
# located in ./lib/file_parser_instructions
#
## Collections
# Each file line mapped to Student object.
# Parsing of one file returns a collection of students.
#
## Output
# Sorter sorts collection by attribute.
# Outputter outputs each object in sorted collection.
#
# Run program with:
# ruby app.rb
class App
  include FileParserInstructions

  def parse_records
    MAPPER.map do |_name, data|
      file_path  = data[:path]
      delimiter  = data[:delimiter]
      line_order = data[:order]
      lines      = FileParser.new(file_path).split_by(delimiter)

      build_students(lines, line_order)
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

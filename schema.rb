Read files
Combine  into one collection
output via specified sort

Input
  Iterate each file
  FileParser.parse(file, delimiter, order)
    => Student.new(row)

Outputter
  OutPutter.new(students, *order)
  => Kirlin Mckayla Atlanta 5/29/1986 Maroon

Root
  app.rb
    include ParseInstructions

    COMMA_PATH = './data/comma.txt'

    rows = FileParser.new(COMMA_PATH).split_by(MAPPER[comma][delimiter])

    students = rows.map{ |row|
      Student.new(row, MAPPER[comma][order])
    }

    students = Sorter.new(students, order, *sort_order)

    $stdout.puts 'Output 1:'
    $stdout.puts OutPutter.new(students).output


Lib
  module
    ParseInstructions
      MAPPER = {
        comma: {
          delimiter: ',',
          order: [
            'last_name', 'first_name', 'campus', 'favorite_color', 'date_of_birth'
          ]
        }
      }
Input
  FileParser
    def initialize(file)

    def split_by(delimiter)

  Student
    def init(row, order)
      attrs = build_attrs(row, order)
      Struct.new(attrs)

    def build_attrs((row, order))
      order.each_with_object({}).with_index do |(attr_name, obj), i|
        obj[attr_name] = row[i]

Output
  students = Sorter.new(students, order, *sort_order)
  OutPutter.new(students, order, *sort_order).output

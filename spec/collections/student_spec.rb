require './app/collections/student'
require './lib/file_parser_instructions'
include FileParserInstructions

describe Student do
  let(:path)            { './spec/fixtures/input.txt' }
  let(:comma_regexp)    { MAPPER[:comma][:delimiter] }
  let(:comma_order)     { MAPPER[:comma][:order] }
  let(:comma_row)       { File.open(path).readlines[0].split(comma_regexp) }
  let(:student)         { Student.build_student(comma_row, comma_order) }
  let(:comma_attrs)     { comma_order.zip(comma_row).to_h }

  context 'comma order' do
    it 'builds a struct given a row and order of attrs' do
      expect(student).to have_attributes(comma_attrs)
    end
  end
end

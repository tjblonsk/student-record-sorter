# frozen_string_literal: true
require './app/collections/student'
require './lib/file_parser_instructions'
include FileParserInstructions

describe Student do
  let(:path)            { './spec/fixtures/input.txt' }
  let(:comma_regexp)    { MAPPER[:comma][:delimiter] }
  let(:comma_order)     { MAPPER[:comma][:order] }
  let(:comma_row)       { File.open(path).readlines[0].split(comma_regexp) }
  let(:student_attrs)   { Student.build_attrs(comma_row, comma_order) }
  let(:student)         { Student.new(student_attrs) }
  let(:comma_attrs)     { comma_order.zip(comma_row).to_h }

  it 'builds attrs from a row' do
    expect(student_attrs).to eq comma_attrs
  end

  context 'comma order' do
    it 'builds a struct given a row and order of attrs' do
      expect(student).to have_attributes(comma_attrs)
    end
  end
end

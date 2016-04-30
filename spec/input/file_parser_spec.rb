# frozen_string_literal: true
require './app/input/file_parser'
require './lib/file_parser_instructions'
include FileParserInstructions

RSpec.describe FileParser do
  let(:path)            { './spec/fixtures/input.txt' }
  let(:file_parser)     { FileParser.new(path) }
  let(:comma_regexp)    { MAPPER[:comma][:delimiter] }
  let(:comma_array)     { File.open(path).readlines[0].split(comma_regexp) }
  let(:invalid_parser)  { FileParser.new(nil) }

  context 'comma delimiter' do
    it 'must split into an array' do
      expect(file_parser.split_by(comma_regexp)[0]).to eq comma_array
    end
  end

  it 'must raise an error if no file path is provided' do
    expect { invalid_parser.split_by(nil) }.to raise_error(RuntimeError)
  end
end

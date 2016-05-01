# frozen_string_literal: true
require './app/input/file_parser'
require './lib/file_parser_instructions'
include FileParserInstructions

describe FileParser do
  let(:path)            { './spec/fixtures/input.txt' }
  let(:input_fixture)   { File.open(path).readlines }

  let(:file_parser)     { FileParser.new(path) }
  let(:invalid_parser)  { FileParser.new(nil) }

  let(:comma_line_idx)      { 0 }
  let(:comma_regexp)    { MAPPER[:comma][:delimiter] }
  let(:comma_array)     { input_fixture[comma_line_idx].split(comma_regexp) }

  let(:dollar_line_idx)  { 1 }
  let(:dollar_regexp)    { MAPPER[:dollar][:delimiter] }
  let(:dollar_array)     { input_fixture[dollar_line_idx].split(dollar_regexp) }

  let(:pipe_line_idx)  { 2 }
  let(:pipe_regexp)    { MAPPER[:pipe][:delimiter] }
  let(:pipe_array)     { input_fixture[pipe_line_idx].split(pipe_regexp) }

  it 'must split into an array by comma' do
    expect(file_parser.split_by(comma_regexp)[comma_line_idx]).to eq comma_array
  end

  it 'must split into an array by dollar' do
    expect(file_parser.split_by(dollar_regexp)[dollar_line_idx]).to eq dollar_array
  end

  it 'must split into an array by pipe' do
    expect(file_parser.split_by(pipe_regexp)[pipe_line_idx]).to eq pipe_array
  end

  it 'must raise an error if no file path is provided' do
    expect { invalid_parser.split_by(nil) }.to raise_error(RuntimeError)
  end
end

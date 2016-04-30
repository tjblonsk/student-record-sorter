# frozen_string_literal: true
require './app/input/file_parser'

RSpec.describe FileParser do
  before do
    @path = './data/comma.txt'
    @file_parser = FileParser.new(@path)
    @invalid_parser = FileParser.new(nil)
  end

  it 'must parse a txt file into an array of lines' do
    expect(@file_parser.parse_lines).to eq File.open(@path).readlines
  end

  it 'must raise an error if no file path is provided' do
    expect { @invalid_parser.parse_lines }.to raise_error(RuntimeError)
  end
end

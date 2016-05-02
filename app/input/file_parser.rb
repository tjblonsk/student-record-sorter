# frozen_string_literal: true

# Given a path to a file located on the machine,
# opens the file and returns an array of lines.
class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def split_by(delimiter_regexp)
    parse_lines.map do |line|
      normalized_line = normalize_city(line.strip)
      split_Line = normalized_line.split(delimiter_regexp)
    end
  end

  private

  def parse_lines
    check_path_presence
    readlines
  end

  def normalize_city(line)
    line.gsub(/NYC/, 'New York City')
        .gsub(/LA/, 'Los Angeles')
        .gsub(/SF/, 'San Francisco')
  end

  def check_path_presence
    raise 'Please provide a valid file path' if @file_path.nil?
  end

  def readlines
    File.open(@file_path).readlines
  rescue => e
    raise "Error reading from file: #{e.message}."
  end
end

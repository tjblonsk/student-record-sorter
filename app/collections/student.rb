# frozen_string_literal: true
require 'ostruct'

# Return hash of attributes from an
# array of values.
# Build Student object from this hash.
class Student < OpenStruct
  DISPLAY_ORDER = [
    :last_name, :first_name, :campus, :date_of_birth_formatted, :favorite_color].freeze

  def self.build_attrs(line, order)
    order.zip(line).to_h
  end

  def date_of_birth_formatted
    return date_of_birth unless date_of_birth =~ /\-/
    date_of_birth.gsub('-', '/')
  end

  def to_s
    DISPLAY_ORDER.map { |attribute| send(attribute) }.join(' ')
  end
end

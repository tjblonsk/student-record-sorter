# frozen_string_literal: true
require 'date'

# Sort each object in a collection
# by attribute.
class Sorter
  def initialize(student_collection)
    @students = student_collection
  end

  def sort_by_date_of_birth
    @students.sort_by do |student|
      Date.parse(format_date(student.date_of_birth_formatted))
    end
  end

  def sort_by(*attributes)
    @students.sort_by { |student| map_attrs(student, attributes) }
  end

  def sort_by_desc(*attributes)
    sort_by(*attributes).reverse
  end

  private

  def format_date(date)
    Date.strptime(date, '%m/%d/%Y').strftime('%d/%m/%Y')
  end

  def map_attrs(student, attributes)
    attributes.map { |attribute| student.send(attribute) }
  end
end

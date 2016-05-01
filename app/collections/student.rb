require 'ostruct'

class Student < OpenStruct
  DISPLAY_ORDER = [:last_name, :first_name, :campus, :date_of_birth, :favorite_color]

  def self.build_attrs(line, order)
    order.zip(line).to_h
  end

  def to_s
    DISPLAY_ORDER.map { |attribute| send(attribute) }.join(' ')
  end
end

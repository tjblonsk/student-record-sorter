require 'ostruct'

class Student < OpenStruct
  DISPLAY_ORDER = [:last_name, :first_name, :campus, :date_of_birth, :favorite_color]

  def self.build_attrs(row, order)
    order.zip(row).to_h
  end

  def to_s
    DISPLAY_ORDER.map { |attribute| send(attribute) }.join(' ')
  end
end

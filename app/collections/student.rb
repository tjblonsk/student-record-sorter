require 'ostruct'

class Student < OpenStruct
  def self.build_student(row, order)
    attrs = build_attrs(row, order)
    new(attrs)
  end

  private

  def self.build_attrs(row, order)
    order.zip(row).to_h
  end
end
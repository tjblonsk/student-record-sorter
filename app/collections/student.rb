require 'ostruct'

class Student < OpenStruct
  def self.build_attrs(row, order)
    order.zip(row).to_h
  end
end

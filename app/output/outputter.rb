# frozen_string_literal: true

# Display each object in a collection.
class Outputter
  def initialize(collection)
    @collection = collection
  end

  def output
    @collection.each { |object| $stdout.puts object.to_s }
  end
end

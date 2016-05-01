class Outputter
  def initialize(collection)
    @collection = collection
  end

  def output
    @collection.each { |object| $stdout.puts object.to_s }
  end
end

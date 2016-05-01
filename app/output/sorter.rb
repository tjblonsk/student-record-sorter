class Sorter
  def initialize(student_collection)
    @students = student_collection
  end

  def sort_by_date_of_birth
    @students.sort_by { |student| Date.parse(format_date(student.date_of_birth)) }
  end

  def sort_by(*attributes)
    @students.sort_by { |student| map_attrs(student, attributes) }
  end

  def sort_by_desc(*attributes)
    sort_by(*attributes).reverse
  end

  private

  def format_date(date)
    format = date =~ /\-/ ? '%m-%d-%Y' : '%m/%d/%Y'
    Date.strptime(date, format).strftime('%d/%m/%Y')
  end

  def map_attrs(student, attributes)
    attributes.map { |attribute| student.send(attribute) }
  end
end

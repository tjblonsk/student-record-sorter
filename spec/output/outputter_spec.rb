# frozen_string_literal: true
require './app/output/outputter'
require './app/collections/student'

describe Outputter do

  let(:student_attrs) do
    {
      last_name: 'Kirlin', first_name: 'Mckayla',
      campus: 'Atlanta', favorite_color: 'Maroon',
      date_of_birth: '5/29/1986'
    }
  end
  let(:student) { Student.new(student_attrs) }
  let(:stdout) do
    "Kirlin Mckayla Atlanta 5/29/1986 Maroon\n"
  end

  it 'calls #to_s on each object in a collection' do
    p student.to_s
    # expect { Outputter.new([student]).output }.to output(stdout).to_stdout
    # expect(Outputter.new([student]).output).to eq output
  end
end

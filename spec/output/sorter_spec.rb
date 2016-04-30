require './app/output/sorter'
require 'ostruct'

describe Sorter do
  let(:student2) { OpenStruct.new(campus: 'B', last_name: 'C', date_of_birth: '12/1/1962') }
  let(:student0) { OpenStruct.new(campus: 'A', last_name: 'A', date_of_birth: '2/14/1962') }
  let(:student1) { OpenStruct.new(campus: 'B', last_name: 'B', date_of_birth: '4/3/1947') }
  let(:students) { [student2, student0, student1] }

  let(:sorted_by_campus_and_last_name_asc)   { Sorter.new(students).sort_by(:campus, :last_name) }
  let(:sorted_by_dob_asc)                    { Sorter.new(students).sort_by_date_of_birth }
  let(:sorted_by_last_name_desc)             { Sorter.new(students).sort_by_desc(:last_name) }

  context 'collection of students' do
    it 'sorts by campus and last name ascending' do
      expect(sorted_by_campus_and_last_name_asc).to eq [student0, student1, student2]
    end

    it 'sorts by date of birth ascending' do
      expect(sorted_by_dob_asc).to eq [student1, student0, student2]
    end

    it 'sorts by last name descending' do
      expect(sorted_by_last_name_desc).to eq [student2, student1, student0]
    end
  end
end
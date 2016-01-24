require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  context "Associations" do
    it { should belong_to :course  }
    it { should belong_to :student }
  end

  context "Validations" do
    it { should validate_presence_of :course_id }
    it { should validate_presence_of :student_id }
  end

  context "Registrate" do
    it "registrates student in a course" do
      classroom = create(:classroom)
      expect(classroom.entry_at).not_to be_nil
      expect(JSON classroom.to_json).to eql(
        {
          "id" => classroom.id,
          "student_id" => classroom.student_id,
          "course_id" => classroom.course_id,
          "entry_at" => classroom.entry_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"),
          "created_at" => classroom.created_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"),
          "updated_at" => classroom.created_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"),
          "course" => {
            "id" => classroom.course.id,
            "name" => classroom.course.name,
            "description" => classroom.course.description,
            "status" => classroom.course.status,
            "created_at" => classroom.course.created_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"),
            "updated_at" => classroom.course.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
          },
          "student" => {
            "id" => classroom.student.id,
            "name" => classroom.student.name,
            "register_number" => classroom.student.register_number,
            "status" => classroom.student.status,
            "created_at" => classroom.student.created_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"),
            "updated_at" => classroom.student.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
          }
        }
      )
    end
  end
end

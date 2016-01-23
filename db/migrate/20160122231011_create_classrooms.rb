class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :student_id, references: "students",  index: true
      t.integer :course_id,  references: "courses",   index: true
      t.datetime :entry_at

      t.timestamps
    end
  end
end

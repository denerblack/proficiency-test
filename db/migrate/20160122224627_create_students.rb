class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :register_number, limit: 45
      t.integer :status

      t.timestamps
    end
  end
end

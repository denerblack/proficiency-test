class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates_uniqueness_of :student_id, scope: :course_id
  validates_presence_of :student_id, :course_id, :entry_at

  before_validation :set_entry_at

  def as_json(options={})
    super(include: [:course, :student])
  end

  private
  def set_entry_at
    self.entry_at = Time.now
  end
end

class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  def as_json(options={})
    super(include: [:course, :student])
  end
end

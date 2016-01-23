class Course < ActiveRecord::Base
  validates_length_of :name,        maximum: 45
  validates_length_of :description, maximum: 45
end

class Course < ActiveRecord::Base
  validates_length_of :name,            is: 45
  validates_length_of :description,     is: 45
end

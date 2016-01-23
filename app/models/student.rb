class Student < ActiveRecord::Base
  validates_length_of :name,              is: 45
  validates_length_of :register_number,   is: 45
end

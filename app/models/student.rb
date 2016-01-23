class Student < ActiveRecord::Base
  validates_length_of :name,              maximum: 45
  validates_length_of :register_number,   maximum: 45
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    student
    course
    entry_at "2016-01-22 20:10:11"
  end
end

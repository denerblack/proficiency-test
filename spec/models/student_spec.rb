require 'rails_helper'

RSpec.describe Student, :type => :model do
  context "Column size" do
    it { should ensure_length_of(:name).is_at_most(45) }
    it { should ensure_length_of(:register_number).is_at_most(45) }
  end
  context "Presence of" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :register_number}
    it { should validate_presence_of :status}
  end

end

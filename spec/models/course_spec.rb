require 'rails_helper'

RSpec.describe Course, :type => :model do
  context "Column size" do
    it { should ensure_length_of(:name).is_at_most(45) }
    it { should ensure_length_of(:description).is_at_most(45) }
  end

  context "Presence of" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description}
    it { should validate_presence_of :status}

  end
end

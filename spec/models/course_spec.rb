require 'rails_helper'

RSpec.describe Course, :type => :model do
  context "Column size" do
    it { should ensure_length_of(:name).is_equal_to(45) }
    it { should ensure_length_of(:description).is_equal_to(45) }
  end
end

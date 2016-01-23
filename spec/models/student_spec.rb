require 'rails_helper'

RSpec.describe Student, :type => :model do
  context "Column size" do
    it { should ensure_length_of(:name).is_equal_to(45) }
  end
end

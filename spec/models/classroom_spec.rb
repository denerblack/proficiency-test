require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  context "Associations" do
    it { should belong_to :course  }
    it { should belong_to :student }
  end
end

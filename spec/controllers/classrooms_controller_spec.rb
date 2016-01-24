require 'rails_helper'

RSpec.describe ClassroomsController, :type => :controller do
  let!(:student){ create(:student)  }
  let!(:course){ create(:course)  }
  let!(:classroom){ create(:classroom)  }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "creates a Classroom" do
      expect {
        post :create, classroom: { student: { id: student.to_param }, course: { id: course.to_param }  }
      }.to change(Classroom, :count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "destroys a Classroom" do
      expect {
        delete :destroy, id: classroom.to_param
      }.to change(Classroom, :count).by(-1)
    end
  end

end

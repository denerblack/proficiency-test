require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do
  let!(:course){ create(:course) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "assigns the requested course as @course" do
      get :show, id: course.to_param
      expect(response).to be_success
      expect(assigns(:course)).to eq course
    end
  end

  describe "GET new" do
    it "assigns the requested course as @course" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "assigns a newly created course as @course" do
      valid_attributes = { name: "English", description: "English Course", status: 1  }
      post :create, course: valid_attributes
      expect(assigns(:course)).to be_a(Course)
      expect(assigns(:course)).to be_persisted
    end
  end

  describe "GET edit" do
    it "assigns the requested course as @course" do
      get :edit, id: course.to_param
      expect(response).to be_success
      expect(assigns(:course)).to eq course
    end
  end

  describe "PUT update" do
    it "redirects to show" do
      put :update, { id: course.to_param, course: { name: "Course edited" } }
      expect(response).to redirect_to(course)
    end
  end

  describe "DELETE destroy" do
    it "destroys requested course" do
      expect{
        delete :destroy, id: course.to_param
      }.to change(Course, :count).by(-1)
    end
  end

end

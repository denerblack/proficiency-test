require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
  let!(:student){ create(:student) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "assigns the requested student as @student" do
      get :show, id: student.to_param
      expect(response).to be_success
      expect(assigns(:student)).to eq student
    end
  end

  describe "GET new" do
    it "assigns the requested student as @student" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "assigns a newly created student as @student" do
      valid_attributes = { name: "John Doe", register_number: 2, status: 1  }
      post :create, student: valid_attributes
      expect(assigns(:student)).to be_a(Student)
      expect(assigns(:student)).to be_persisted
    end
  end

  describe "GET edit" do
    it "assigns the requested student as @student" do
      get :edit, id: student.to_param
      expect(response).to be_success
      expect(assigns(:student)).to eq student
    end
  end

  describe "PUT update" do
    it "redirects to show" do
      put :update, { id: student.to_param, student: { name: "Student edited" } }
      expect(response).to redirect_to(student)
    end
  end

  describe "DELETE destroy" do
    it "destroys requested student" do
      expect{
        delete :destroy, id: student.to_param
      }.to change(Student, :count).by(-1)
    end
  end

end

class ClassroomsController < ApplicationController
  respond_to :html, :json
  def index
    @students = Student.all
    @courses  = Course.all
    respond_to do |format|
      format.json { render json: Classroom.all }
      format.html
    end
  end

  def create
    respond_with Classroom.create!(
      student_id: classrooms_params[:student][:id],
      course_id: classrooms_params[:course][:id]
    )
  end

  def destroy
    respond_with Classroom.destroy(params[:id])
  end

  def classrooms_params
    puts params
    params.require(:classroom).permit(course: [:id, :name], student: [:id, :name])
  end
end

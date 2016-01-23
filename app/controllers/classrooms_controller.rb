class ClassroomsController < ApplicationController
  respond_to :json
  def index
#    @students = Student.all
#    @courses  = Course.all
#    puts Classroom.all.to_json
    respond_to do |format|
      format.json { render json: Classroom.all }
      format.html
    end
  end

  def create
    respond_with Classroom.create(classrooms_params)
  end

  def destroy
  end

  def classrooms_params
    params.require(:classroom).permit(course: [:id], student: [:id])
  end
end

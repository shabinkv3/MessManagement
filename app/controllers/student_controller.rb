class StudentController < ApplicationController
  def dashboard
  	if session[:student_logged_in]
  		@student=Student.find(session[:id])
  	else
  		redirect_to login_path
  	end
  end
  def data
  	@students=Student.all
  	render json: @students
  end
end

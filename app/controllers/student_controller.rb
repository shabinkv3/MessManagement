class StudentController < ApplicationController
  def dashboard
  	if session[:student_logged_in]
  		@student=Student.find(session[:id])
  	else
  		redirect_to login_path
  	end
  end
  def dataGet
  	@mess=Mess.find(session[:id])
  	render json: @mess.students
  end

end

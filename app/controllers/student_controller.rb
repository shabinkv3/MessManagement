class StudentController < ApplicationController
  def dashboard
  	if session[:logged_in]
  		@student=Student.find_by_rollno(session[:user_id])
  	else
  		redirect_to login_path
  	end
  end
end

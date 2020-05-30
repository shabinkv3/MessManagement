class StudentController < ApplicationController
  before_action :enter_only_if_student_logged_in, except: :dataGet
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

  def enter_only_if_student_logged_in
    if session[:id]==nil
      redirect_to login_path
    elsif session[:mess_logged_in]
      redirect_to mess_dash_path
    end
  end

end

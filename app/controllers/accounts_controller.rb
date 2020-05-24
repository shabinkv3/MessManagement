class AccountsController < ApplicationController
  def login
  end

  def authenticate
  	@student=Student.find_by_rollno(student_params[:rollno])
  	if @student && @student.authenticate(student_params[:password])
  		session[:logged_in]=true
  		session[:user_id]=student_params[:rollno]
  		redirect_to student_dash_path
  	else
  		flash[:alert] = "Email or password is invalid"
  		redirect_to login_path
  	end

  end

  def logout
  	session[:logged_in]=false
  	session[:user_id]=nil
  	redirect_to login_path
  end


  def signupStudent
  	@student=Student.new
  end
  def createStudent
    @student=Student.new(student_params)
    if @student.save
      session[:logged_in]=true
      session[:user_id]=@student.rollno
      redirect_to student_dash_path()
    else
      render "signupStudent"
    end
  end


  private
  def student_params
    params.require(:student).permit(:name,:email,:rollno,:mess,:password,:password_confirmation,:roomno)
  end
end

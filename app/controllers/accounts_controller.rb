class AccountsController < ApplicationController
  before_action :go_to_dashboard_if_logged_in, except: :logout

  def login
  end


  def check
    render json: {:val => 'lost'}
  end

  def signupMess
    @mess=Mess.new
  end

  def signupStudent
    @student=Student.new
    @mess=Mess.all
  end

  def authenticate
    @student=Student.find_by_rollno(student_params[:rollno])
    if @student && @student.authenticate(student_params[:password])
      session[:student_logged_in]=true
      session[:id]=@student.id
      redirect_to student_dash_path
    else
      flash[:alert] = "Email or password is invalid"
      redirect_to login_path
    end

  end

  def authenticateMess
    @mess = Mess.find_by_mess_name(mess_params[:mess_name].downcase)
    if @mess && @mess.authenticate(mess_params[:password])
      session[:mess_logged_in]=true
      session[:id]=@mess.id
      redirect_to mess_dash_path
    else
      flash[:alert] = "Email or password is Invalid"
      redirect_to login_path
    end
  end


  def createMess
    @params=mess_params
    @params[:mess_name]=@params[:mess_name].downcase
    @mess=Mess.new(@params)
    if @mess.save
      session[:mess_logged_in]=true
      session[:id]=@mess.id
      redirect_to mess_dash_path()
    else
      render "signupMess"
    end
  end

  def logout
    session[:student_logged_in]=false
    session[:mess_logged_in]=false
    session[:id]=nil
    redirect_to login_path
  end

  def createStudent
    @params=student_params
    @params[:mess_id]=0
    @params[:name]=@params[:name].split.map(&:capitalize).join(' ')
    @mess=Mess.find_by_mess_name(student_params[:mess_id].downcase)
    if @mess
      @params[:mess_id]=@mess.id
    end
    @student=Student.new(@params)
    if @student.save
      session[:student_logged_in]=true
      session[:id]=@student.id
      redirect_to student_dash_path()
    else
      render "signupStudent"
    end
  end


  private
  def student_params
    params.require(:student).permit(:email,:name,:rollno,:mess_id,:password,:password_confirmation,:roomno)
  end


  private
  def mess_params
    params.require(:mess).permit(:password,:password_digest,:mess_name)
  end


  def go_to_dashboard_if_logged_in
    if session[:mess_logged_in]
      redirect_to mess_dash_path
    elsif session[:student_logged_in]
      redirect_to student_dash_path
    end
  end
end



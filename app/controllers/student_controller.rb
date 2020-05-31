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

  def createMessCut
    @params=messcut_params
    @params[:student_id]=session[:id]
    @messcut=MessCut.new(@params)
    if @messcut.save
      render json: {:added=>true}
    else
      render json: {:added=>false,:errors=>@messcut.errors.full_messages}
    end
  end
end


private
  def messcut_params
    params.require(:messcut).permit(:from_date,:to_date,:no_of_days)
  end
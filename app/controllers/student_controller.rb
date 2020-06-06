class StudentController < ApplicationController
  before_action :enter_only_if_student_logged_in, except: [:changePassword,:dataGet,:getExtraList,:getGuestList,:studentProfile,:getFee,:messCutData]
  def dashboard
  	if session[:student_logged_in]
  		@student=Student.find(session[:id])
  	else
  		redirect_to login_path
  	end
  end

  def changePassword
    @student=Student.find(session[:id])
    current=change_password_params[:current]
    if BCrypt::Password.new(@student.password_digest)!=current
      render json: {:change=>false,:errors=>['Current Password is wrong']}
    else
      newPassword=change_password_params[:new]
      @student.password=newPassword
      if @student.save
        render json: {:changed=>true}
      else
        render json: {:changed=>false,:errors=>@student.errors.full_messages}
      end
    end
  end

  def dataGet
  	@mess=Mess.find(session[:id])
  	render json: @mess.students
  end

  def messCutData
    @student=Student.find(profile_params[:student_id])
    render json: {:data => @student.mess_cuts}
  end

  def enter_only_if_student_logged_in
    if session[:id]==nil
      redirect_to login_path
    elsif session[:mess_logged_in]
      redirect_to mess_dash_path
    end
  end

  def getExtraList
      @student=Student.find(extra_list_params[:student_id])
      @extra=@student.extras
      render json: {:data => @extra}
  end

  def getGuestList
      @student=Student.find(guest_list_params[:student_id])
      @guest=@student.guests
      render json: {:data => @guest}
  end

  def getFee
      @student=Student.find(fee_params[:student_id])
      @extra=@student.extras
      @guest=@student.guests
      @messcut=@student.mess_cuts
      render json: {:extra => @extra, :guest => @guest, :messcut => @messcut}
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
  def studentProfile
    @student=Student.find(profile_params[:student_id])
    render json: {:data=>@student}
  end


private
  def messcut_params
    params.require(:messcut).permit(:from_date,:to_date,:no_of_days)
  end

private
  def extra_list_params
    params.require(:extra_list).permit(:student_id)
  end
private
  def guest_list_params
    params.require(:guest_list).permit(:student_id)
  end
private
  def profile_params
    params.require(:student_profile).permit(:student_id)
  end
private
  def fee_params
    params.require(:fee).permit(:student_id)
  end
private
  def change_password_params
    params.require(:change_password).permit(:current,:new)
  end
end
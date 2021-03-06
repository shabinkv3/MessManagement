class MessController < ApplicationController
  before_action :enter_only_if_mess_logged_in
  def dashboard
    @mess = Mess.find(session[:id])
    @staff=Staff.new
	end
  def createStaff
  	@params=staff_params
  	@params[:name]=@params[:name].split.map(&:capitalize).join(' ')
  	@params[:mess_id]=session[:id]
  	@staff=Staff.new(@params)
  	if @staff.save
  		render json: {:added=>true}
  	else
  		render json: {:added=>false,:errors=>@staff.errors.full_messages}
  	end
  end

  def changePassword
    @mess=Mess.find(session[:id])
    current=change_password_params[:current]
    if BCrypt::Password.new(@mess.password_digest)!=current
      render json: {:change=>false,:errors=>['Current Password is wrong']}
    else
      newPassword=change_password_params[:new]
      @mess.password=newPassword
      if @mess.save
        render json: {:changed=>true}
      else
        render json: {:changed=>false,:errors=>@mess.errors.full_messages}
      end
    end
  end


  def createEntry
    @params = extra_params
    @student=Student.find_by_rollno(@params[:student_id])
    if @student
      @params[:student_id]=@student.id
    else
      @params[:student_id]=0
    end
   
    @extra=Extra.new(@params)
    if @extra.save
      render json: {:added=>true}
    else
      render json: {:added=>false,:errors=>@extra.errors.full_messages}
    end
    
  end
  def addGuest
    @params = guest_params
    @student=Student.find_by_rollno(@params[:student_id])
    if @student
      @params[:student_id]=@student.id
    else
      @params[:student_id]=0
    end
   
    @guest=Guest.new(@params)
    if @guest.save
      render json: {:added=>true}
    else
      render json: {:added=>false,:errors=>@guest.errors.full_messages}
    end
    
  end

	def staffData
		@mess=Mess.find(session[:id])
  		render json: @mess.staffs
	end
	def deleteStaff
		@staff=Staff.find(del_staff[:id])
		@staff.destroy
		render json: {:deleted=>true}
	end

  def messcutMess
    @mess=Mess.find(session[:id])
    @student=Student.all
    @messcut=MessCut.all
    @studentCount=Student.count
    @messcutCount=MessCut.count
    render json: {:messcut => @messcut, :student => @student, :messcutCount => @messcutCount, :studentCount => @studentCount}
  end

  private
  def staff_params
    params.require(:staff).permit(:name,:phoneno)
  end
  private
  def del_staff
  	params.require(:staff).permit(:id)
  end
  private
  def extra_params
    params.require(:extra).permit(:student_id,:item,:price)
  end
  private
  def guest_params
    params.require(:guest).permit(:student_id,:name,:rollno)
  end
  private
  def change_password_params
    params.require(:change_password).permit(:current,:new)
  end

  def enter_only_if_mess_logged_in
    if session[:id]==nil
      redirect_to login_path
    elsif session[:student_logged_in]
      redirect_to student_dash_path
    end
  end
end

class MessController < ApplicationController
  def dashboard
  		puts 1
		if session[:mess_logged_in]
			@mess = Mess.find(session[:id])
			@staff=Staff.new
		else
			redirect_to loginMess_path
		end
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

	def staffData
		@mess=Mess.find(session[:id])
  		render json: @mess.staffs
	end
	def deleteStaff
		@staff=Staff.find(del_staff[:id])
		@staff.destroy
		render json: {:deleted=>true}
	end


  private
  def staff_params
    params.require(:staff).permit(:name,:phoneno)
  end
  private
  def del_staff
  	params.require(:staff).permit(:id)
  end
end

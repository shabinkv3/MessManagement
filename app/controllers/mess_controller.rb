class MessController < ApplicationController
  def dashboard
		if session[:mess_logged_in]
			@mess = Mess.find(session[:id])
		else
			redirect_to loginMess_path
		end
	end
end

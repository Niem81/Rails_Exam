class SessionsController < ApplicationController

	def new
  	end

	def create
	  	user = User.find_by(email: params[:session][:email].downcase)
	  	if user && user.authenticate(params[:session][:password])
	  		#log in
	  		log_in user
	  		redirect_to '/songs'
	  	else
	  		#error
	  		flash[:errors] = ["Invalid email/password combination"] #using flash.now ?? => for display the flash in the render page
	  		redirect_to '/main'
	  	end
	end

	def destroy
	 	session[:user_id] = nil
	  	redirect_to '/main'
	end
end

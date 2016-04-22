class UsersController < ApplicationController

 	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show]

	def index
		redirect_to '/main'
	end

	def show
		@user = User.find(params[:id])
		@user = current_user unless @user
	end

	def create
  		@user = User.new(user_params)
  		if @user.save
  			#sth
  			log_in @user
  			redirect_to '/songs'
  		else
  			#error
  			flash[:errors] = @user.errors.full_messages
  			redirect_to '/main'
  		end
	end

	def new
		@user = User.new
	end

	# def edit
	# 	@user = current_user
	# end

	# def update
	# 	@user = current_user
	#     if @user.update(user_params)
	#       flash[:success] = "User successfully updated"
	#       redirect_to @user
	#     else
	#       flash[:errors] = @user.errors.full_messages
	#       redirect_to :back
	#     end	
	# end

	# def destroy
	# 	@user = current_user
	# 	@user.destroy
	# 	redirect_to 'sessions#destroy'
	# end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end

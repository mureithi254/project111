class SuperAdminsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def attempt_login
	end

	def login
	end

	def logout
	end

	private
	#set super_admin 
	def set_super_admin
      @super_admin = SuperAdmin.find(params[:id])
	end

	#super admin params
	def super_admin_params
       params.require(:super_admin).permit(:first_name,:last_name,:username,:email,:password)
	end


end

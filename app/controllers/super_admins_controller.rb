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

	def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
            super_admin = SuperAdmin.where(:username => params[:username]).first
            if super_admin
            	authorize_super_admin = super_admin.authenticate(params[:password])
            end
		end

		if authorize_super_admin
            session[:super_admin_id] = authorize_super_admin.id
            flash[:notice] = 'You are logged in'
            redirect_to super_admins_path

        else
        	flash.now[:notice] = 'Wrong username/password combination'
        	redirect_to super_admins_login_path
		end
	end

	def logout
		session[:super_admin_id] = nil
		flash[:notice] = 'You are logged out'
		redirect_to super_admins_login_path
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

class SuperAdminsController < ApplicationController
	before_action :confirm_super_admin_is_logged_in ,except: [:login,:logout,:attempt_login]
	before_action :set_super_admin ,only: [:show,:update,:destroy,:edit]
	def index
		@super_admin = SuperAdmin.all
	end

	def super_admins_menu
	end

	def show
	end

	def new
		@super_admin = SuperAdmin.new
	end

	def create
		@super_admin = SuperAdmin.new(super_admin_params)
		if @super_admin.save
           flash[:notice] = 'Super Admin added successfully'
           redirect_to super_admins_path
       else
       	flash[:notice] = 'Super Admin was not created'
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@super_admin.destroy
		respond_to do | format |
          format.html{redirect_to super_admins_path ,notice: 'Super Admin successfully deleted'}
          format.json{head :no_content}
		end
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
            redirect_to super_admins_super_admins_menu_path

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

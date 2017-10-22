class AdminsController < ApplicationController
	before_action :confirm_logged_in ,except: [:login,:attempt_login,:logout]
	before_action :set_admin, only: [:show,:update,:edit,:destroy] 
	#list all admins
	def index
		@admin_list = Admin.all
	end


	def new
		@admin = Admin.new
	end

    #create new admin
	def create
		@admin = Admin.new(admin_params)
        if @admin.save
          flash[:notice] = 'Admin has been successfully created'
          redirect_to admins_path
      else
      	flash[:notice] = 'New admin was not created'
		end
	end

	def show
	end

	def edit
	end

	def update

	end

    #destroy admin access
	def destroy
	  @admin.destroy
	  respond_to do |format|
         format.html{ redirect_to admins_path, notice:'successfully deleted admin user' }
         format.json {head :no_content}
	  end

	end

	def login
		#render admin_login form
	end
	def attempt_login
		#handle the login
		if params[:username].present? && params[:password].present?
           admin_found = Admin.where(:username => params[:username]).first

           if admin_found
             authorized_admin = admin_found.authenticate(params[:password])
           end
		end

		if authorized_admin
           session[:admin_id] = authorized_admin.id
           flash[:notice] = 'You are logged in'
           redirect_to admins_path
       else
       	   flash.now[:notice] = "invalid username/password combination"
       	   render('login')
		end
	end

    #admin logout
	def logout
		session[:admin_id] = nil
		flash[:notice] = 'Logged out'
		redirect_to admins_login_path
	end

	private
     #a method to confirm if a user is logged in before we could do anything
	def confirm_logged_in 
       unless session[:admin_id]
         flash[:notice] = 'Please log in'
         redirect_to admins_login_path 
       end
	end

	def set_admin
      @admin = Admin.find(params[:id])
	end
    
    def admin_params
       params.require(:admin).permit(:first_name,:last_name,:username,:email,:password)
    end


end

class AdminsController < ApplicationController
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
	end

    #admin logout
	def logout
	end

	private

	def set_admin
      @admin = Admin.find(params[:id])
	end
    
    def admin_params
       params.require(:admin).permit(:first_name,:last_name,:username,:email,:password)
    end


end

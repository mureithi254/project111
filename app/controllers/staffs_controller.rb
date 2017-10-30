class StaffsController < ApplicationController
	before_action :admin_confirm_logged_in
    before_action :set_staff, only: [:show,:update,:edit,:destroy]

	def index
		#list all the staff members
      @staff_list = Staff.all
	end

	def new
		@staff = Staff.new(staff_params)
	end

	def show
	end

	def create
		@staff = Staff.new(staff_params)
	end

	def destroy
		@staff.destroy
        redirect_to staffs_path
        flash[:notice] = 'Staff has been successfully deleted'
	end

	def update
	end 

	def edit
	end

	
    private
    

    def set_staff
       @staff = Staff.find(params[:id])
    end
    	
     def staff_params
        params.require(:staff).permit(:first_name,:last_name,:phone_number,:email,:username,:password)
     end

end

class HomeController < ApplicationController
	before_action :confirm_logged_in ,only: [:index]

	def index
		@emergency = Emergency.last
		@hash = Gmaps4rails.build_markers(@emergency) do |emergency, marker|
			marker.lat emergency.latitude
			marker.lng emergency.longitude
			marker.infowindow emergency.description

			marker.json({ description: emergency.description })

		end 
	end

	def login
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
	        approved_staff = Staff.where(:username => params[:username]).first
		    if approved_staff
	             authorized_staff = approved_staff.authenticate(params[:password])
		    end
		end

		if authorized_staff
	       session[:staff_id] = authorized_staff.id
	       flash[:notice] = 'You are logged in'
	       redirect_to home_index_path

	   else
	   	  flash.now[:notice] = 'Invalid username/password combination'
	   	  redirect_to login_path
		end
	end

	def logout
		session[:staff_id] = nil
		flash[:notice] = 'You are logged out'
		redirect_to login_path
	end

	private
    
    def confirm_logged_in
      unless session[:staff_id]
         flash[:notice] = 'You must be logged in'
         redirect_to login_path
      end
    end
end

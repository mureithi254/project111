class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #confirm super_admin is logged in
    def confirm_super_admin_is_logged_in
      unless session[:super_admin_id]
        flash[:notice] = 'Please log in as super admin'
        redirect_to  super_admins_login_path
      end
    end

  #confirm admin is logged in
  def admin_confirm_logged_in 
       unless session[:admin_id]
         flash[:notice] = 'Please log in'
         redirect_to admin_path 
       end
	end
end

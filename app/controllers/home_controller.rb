class HomeController < ApplicationController
  def index
    @emergency = Emergency.last
  	@hash = Gmaps4rails.build_markers(@emergency) do |emergency, marker|
      marker.lat emergency.latitude
      marker.lng emergency.longitude
      marker.infowindow emergency.description
 
      marker.json({ description: emergency.description })
   
	end 
  end
end

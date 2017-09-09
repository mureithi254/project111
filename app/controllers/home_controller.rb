class HomeController < ApplicationController
  def index
  	@hospitals = Hospital.all
    @hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
	  marker.lat hospital.latitude
	  marker.lng hospital.longitude
	end
  end
end

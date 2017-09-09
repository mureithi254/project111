class MapController < ApplicationController
  def home
  	@hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
      marker.lat hospital.latitude
      marker.lng hospital.longitude
    end
  end
end

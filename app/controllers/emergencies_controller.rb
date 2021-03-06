class EmergenciesController < ApplicationController
  before_action :admin_confirm_logged_in
  before_action :set_emergency, only: [:show, :edit, :update, :destroy]

  # GET /emergencies
  # GET /emergencies.json
  def index
    @emergencies = Emergency.all
    @emergency_last = Emergency.last
    @geojson = Array.new

         @geojson << {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [@emergency_last.longitude, @emergency_last.latitude]
              },
              properties: {
                name: @emergency_last.description,
                address: @emergency_last.address,
                description: @emergency_last.description,
                BusType: 'emergency',
                :'marker-color' => '#00607d',
                :'marker-symbol' => 'circle',
                :'marker-size' => 'medium'
              }
            }
  
      respond_to do |format|
         format.html
         format.json{ render json: @geojson }
      end
  end

  # GET /emergencies/1
  # GET /emergencies/1.json
  def show
  end

  # GET /emergencies/new
  def new
    @emergency = Emergency.new
  end

  # GET /emergencies/1/edit
  def edit
  end

  # POST /emergencies
  # POST /emergencies.json
  def create
    @emergency = Emergency.new(emergency_params)

    respond_to do |format|
      if @emergency.save
        format.html { redirect_to @emergency, notice: 'Emergency was successfully created.' }
        format.json { render :show, status: :created, location: @emergency }
      else
        format.html { render :new }
        format.json { render json: @emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergencies/1
  # PATCH/PUT /emergencies/1.json
  def update
    respond_to do |format|
      if @emergency.update(emergency_params)
        format.html { redirect_to @emergency, notice: 'Emergency was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency }
      else
        format.html { render :edit }
        format.json { render json: @emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergencies/1
  # DELETE /emergencies/1.json
  def destroy
    @emergency.destroy
    respond_to do |format|
      format.html { redirect_to emergencies_url, notice: 'Emergency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency
      @emergency = Emergency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_params
      params.require(:emergency).permit(:address, :latitude, :longitude, :description, :client_id)
    end
end

class HospitalsController < ApplicationController
  before_action :admin_confirm_logged_in
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  # GET /hospitals
  # GET /hospitals.json
  def index
    @hospitals = Hospital.all
    @geojson = Array.new

      @hospitals.each do |hospital|
         @geojson << {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [hospital.longitude, hospital.latitude]
              },
              properties: {
                name: hospital.name,
                address: hospital.address,
                contact: hospital.phone,
                BusType: 'hospital',
                popupContent: "#{hospital.address} and contact #{hospital.phone}",
                :'marker-color' => '#00607d',
                :'marker-symbol' => 'circle',
                :'marker-size' => 'medium'
              }
            }
      end
      respond_to do |format|
         format.html
         format.json{ render json: @geojson }
      end
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:address, :latitude, :longitude, :name, :phone, :email)
    end
end

class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  # GET /services
  # GET /services.json
  def index
    @services = Service.where("service_type != ?", "All")
    @venues = getVenuesFromService(@services.first.id)
    @vendor_dates = getDatesFromVendor(@venues.first.vendor_id, @services.first.id)
    @florists, @caterers, @photographers = getVendorFromVenue(@venues.first.id, @services.first.id, @vendor_dates)
  end

  def update_venues
    @venues = getVenuesFromService(params[:service_id])
    respond_to do |format|
      format.js 
    end
  end

  def update_dates
    vendor_id = Venue.find(params[:venue_id]).vendor_id
    @vendor_dates = getDatesFromVendor(vendor_id, params[:service_id])
    respond_to do |format|
      format.js 
    end
  end

  def update_partners
    @florists, @caterers, @photographers = getVendorFromVenue(params[:venue_id], params[:service_id], params[:vendor_date])
    respond_to do |format|
      format.js 
    end
  end

  def getVendorFromVenue(venue_id, service_id, vendor_dates)
    f_dates = formatDates(vendor_dates)
    florists = Florist.joins("JOIN venue_to_vendors ON venue_to_vendors.vendor_id = florists.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = florists.vendor_id WHERE venue_to_vendors.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = 1) AND vendor_dates.date in (#{f_dates}) GROUP BY florists.id")
    caterers = Caterer.joins("JOIN venue_to_vendors ON venue_to_vendors.vendor_id = caterers.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = caterers.vendor_id WHERE venue_to_vendors.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = 1) AND vendor_dates.date in (#{f_dates}) GROUP BY caterers.id")
    photographers = Photographer.joins("JOIN venue_to_vendors ON venue_to_vendors.vendor_id = photographers.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = photographers.vendor_id WHERE venue_to_vendors.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = 1) AND vendor_dates.date in (#{f_dates}) GROUP BY photographers.id")
    return florists, caterers, photographers
  end

  def getDatesFromVendor(vendor_id, service_id)
    dates = []
    VendorDate.where("vendor_id = ? AND (service_id = ? OR service_id = 1)", vendor_id, service_id).each { |d| dates << d.date }
    return dates
  end

  def formatDates(vendor_dates)
    formatted_dates= "'#{vendor_dates.join("','")}'"
    return formatted_dates
  end

  def getVenuesFromService(service_id)
    return Venue.joins("JOIN vendor_dates ON vendor_dates.vendor_id = venues.vendor_id WHERE (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = 1) GROUP BY venues.id")
  end

  def renderDates
    respond_to do |format|
      format.json { render json: @vendor_dates }
    end
  end


  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup OR constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_type)
    end
end

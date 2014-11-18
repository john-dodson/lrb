class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  @all_id = Service.where("service_type = 'All'").first.id
  # GET /services
  # GET /services.json
  def index
    @services = Service.where("service_type != 'ALL'")
    @venues = getVenuesFromService(@services.first.id)
    @vendor_dates = getDatesFromVendor(@venues.first.id, @services.first.id)
    @florists = getVendorFromVenue(@venues.first.id, @services.first.id, @vendor_dates.first.id, "florists")
    @caterers = getVendorFromVenue(@venues.first.id, @services.first.id, @vendor_dates.first.id, "caterers")
    @photographers = getVendorFromVenue(@venues.first.id, @services.first.id, @vendor_dates.first.id, "photographers")
  end

  def update
    @venues = getVenuesFromService(params[:service_id])
    @vendor_dates = getDatesFromVendor(params[:vendor_id], params[:service_id])
    @florists = getVendorFromVenue(params[:venue_id], parmas[:service_id], params[:vendor_date_id], "florists")
    @caterers = getVendorFromVenue(params[:venue_id], parmas[:service_id], params[:vendor_date_id], "caterers")
    @photographers = getVendorFromVenue(params[:venue_id], parmas[:service_id], params[:vendor_date_id], "photographers")
    respond_to do |format|
      format.js
    end
  end

  def getVendorFromVenue(venue_id, service_id, vendor_date_id, vendor_type)
    Florists.joins("JOIN venue_to_vendors ON venue_to_vendor.vendor_id = #{vendor_type}.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = #{vendor_type}.vendor_id WHERE venue_to_vendor.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = #{@all_id}) AND vendor_dates.id = #{vendor_date_id}") if vendor_type == "florists"
    Caterers.joins("JOIN venue_to_vendors ON venue_to_vendor.vendor_id = #{vendor_type}.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = #{vendor_type}.vendor_id WHERE venue_to_vendor.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = #{@all_id}) AND vendor_dates.id = #{vendor_date_id}") if vendor_type == "caterers"
    Photographers.joins("JOIN venue_to_vendors ON venue_to_vendor.vendor_id = #{vendor_type}.vendor_id JOIN vendor_dates on vendor_dates.vendor_id = #{vendor_type}.vendor_id WHERE venue_to_vendor.venue_id = #{venue_id} AND (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = #{@all_id}) AND vendor_dates.date = #{vendor_date_id}") if vendor_type == "Photographers"
  end

  def getDatesFromVendor(vendor_id, service_id)
    return VendorDates.where("vendor_id = ? AND (service_id = ? OR service_id = ?)", vendor_id, service_id, @all_id)
  end

  def getVenuesFromService(service_id)
    return Venue.joins("JOIN vendor_dates ON vendor_date.vendor_id = venues.vendor_id WHERE (vendor_dates.service_id = #{service_id} OR vendor_dates.service_id = #{@all_id})")
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

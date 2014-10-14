class VenueToVendorsController < ApplicationController
  before_action :set_venue_to_vendor, only: [:show, :edit, :update, :destroy]

  # GET /venue_to_vendors
  # GET /venue_to_vendors.json
  def index
    @venue_to_vendors = VenueToVendor.all
  end

  # GET /venue_to_vendors/1
  # GET /venue_to_vendors/1.json
  def show
  end

  # GET /venue_to_vendors/new
  def new
    @venue_to_vendor = VenueToVendor.new
  end

  # GET /venue_to_vendors/1/edit
  def edit
  end

  # POST /venue_to_vendors
  # POST /venue_to_vendors.json
  def create
    @venue_to_vendor = VenueToVendor.new(venue_to_vendor_params)

    respond_to do |format|
      if @venue_to_vendor.save
        format.html { redirect_to @venue_to_vendor, notice: 'Venue to vendor was successfully created.' }
        format.json { render :show, status: :created, location: @venue_to_vendor }
      else
        format.html { render :new }
        format.json { render json: @venue_to_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venue_to_vendors/1
  # PATCH/PUT /venue_to_vendors/1.json
  def update
    respond_to do |format|
      if @venue_to_vendor.update(venue_to_vendor_params)
        format.html { redirect_to @venue_to_vendor, notice: 'Venue to vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue_to_vendor }
      else
        format.html { render :edit }
        format.json { render json: @venue_to_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_to_vendors/1
  # DELETE /venue_to_vendors/1.json
  def destroy
    @venue_to_vendor.destroy
    respond_to do |format|
      format.html { redirect_to venue_to_vendors_url, notice: 'Venue to vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue_to_vendor
      @venue_to_vendor = VenueToVendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_to_vendor_params
      params.require(:venue_to_vendor).permit(:venue_id, :vendor_id, :vendor_type_id)
    end
end

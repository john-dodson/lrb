class ServiceToVendorsController < ApplicationController
  before_action :set_service_to_vendor, only: [:show, :edit, :update, :destroy]

  # GET /service_to_vendors
  # GET /service_to_vendors.json
  def index
    @service_to_vendors = ServiceToVendor.all
  end

  # GET /service_to_vendors/1
  # GET /service_to_vendors/1.json
  def show
  end

  # GET /service_to_vendors/new
  def new
    @service_to_vendor = ServiceToVendor.new
  end

  # GET /service_to_vendors/1/edit
  def edit
  end

  # POST /service_to_vendors
  # POST /service_to_vendors.json
  def create
    @service_to_vendor = ServiceToVendor.new(service_to_vendor_params)

    respond_to do |format|
      if @service_to_vendor.save
        format.html { redirect_to @service_to_vendor, notice: 'Service to vendor was successfully created.' }
        format.json { render :show, status: :created, location: @service_to_vendor }
      else
        format.html { render :new }
        format.json { render json: @service_to_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_to_vendors/1
  # PATCH/PUT /service_to_vendors/1.json
  def update
    respond_to do |format|
      if @service_to_vendor.update(service_to_vendor_params)
        format.html { redirect_to @service_to_vendor, notice: 'Service to vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_to_vendor }
      else
        format.html { render :edit }
        format.json { render json: @service_to_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_to_vendors/1
  # DELETE /service_to_vendors/1.json
  def destroy
    @service_to_vendor.destroy
    respond_to do |format|
      format.html { redirect_to service_to_vendors_url, notice: 'Service to vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_to_vendor
      @service_to_vendor = ServiceToVendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_to_vendor_params
      params.require(:service_to_vendor).permit(:service_id, :vendor_id, :vendor_type_id)
    end
end

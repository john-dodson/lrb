class VendorDatesController < ApplicationController
  before_action :set_vendor_date, only: [:show, :edit, :update, :destroy]

  # GET /vendor_dates
  # GET /vendor_dates.json
  def index
    @vendor_dates = VendorDate.all
  end

  # GET /vendor_dates/1
  # GET /vendor_dates/1.json
  def show
  end

  # GET /vendor_dates/new
  def new
    @vendor_date = VendorDate.new
  end

  # GET /vendor_dates/1/edit
  def edit
  end

  # POST /vendor_dates
  # POST /vendor_dates.json
  def create
    puts vendor_date_params
    @vendor_date = VendorDate.new(vendor_date_params)

    respond_to do |format|
      if @vendor_date.save
        format.html { redirect_to @vendor_date, notice: 'Venue date was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_date }
      else
        format.html { render :new }
        format.json { render json: @vendor_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_dates/1
  # PATCH/PUT /vendor_dates/1.json
  def update
    respond_to do |format|
      if @vendor_date.update(vendor_date_params)
        format.html { redirect_to @vendor_date, notice: 'Venue date was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_date }
      else
        format.html { render :edit }
        format.json { render json: @vendor_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_dates/1
  # DELETE /vendor_dates/1.json
  def destroy
    @vendor_date.destroy
    respond_to do |format|
      format.html { redirect_to vendor_dates_url, notice: 'Venue date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_date
      @vendor_date = VendorDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_date_params
      params.require(:vendor_date).permit(:vendor_id, :date, :service_id)
    end
end

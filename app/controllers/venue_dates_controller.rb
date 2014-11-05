class VenueDatesController < ApplicationController
  before_action :set_venue_date, only: [:show, :edit, :update, :destroy]

  # GET /venue_dates
  # GET /venue_dates.json
  def index
    @venue_dates = VenueDate.all
  end

  # GET /venue_dates/1
  # GET /venue_dates/1.json
  def show
  end

  # GET /venue_dates/new
  def new
    @venue_date = VenueDate.new
  end

  # GET /venue_dates/1/edit
  def edit
  end

  # POST /venue_dates
  # POST /venue_dates.json
  def create
    puts venue_date_params
    @venue_date = VenueDate.new(venue_date_params)

    respond_to do |format|
      if @venue_date.save
        format.html { redirect_to @venue_date, notice: 'Venue date was successfully created.' }
        format.json { render :show, status: :created, location: @venue_date }
      else
        format.html { render :new }
        format.json { render json: @venue_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venue_dates/1
  # PATCH/PUT /venue_dates/1.json
  def update
    respond_to do |format|
      if @venue_date.update(venue_date_params)
        format.html { redirect_to @venue_date, notice: 'Venue date was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue_date }
      else
        format.html { render :edit }
        format.json { render json: @venue_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_dates/1
  # DELETE /venue_dates/1.json
  def destroy
    @venue_date.destroy
    respond_to do |format|
      format.html { redirect_to venue_dates_url, notice: 'Venue date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue_date
      @venue_date = VenueDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_date_params
      params.require(:venue_date).permit(:venue_id, :date, :service_id)
    end
end

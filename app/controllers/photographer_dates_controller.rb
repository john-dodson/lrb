class PhotographerDatesController < ApplicationController
  before_action :set_photographer_date, only: [:show, :edit, :update, :destroy]

  # GET /photographer_dates
  # GET /photographer_dates.json
  def index
    @photographer_dates = PhotographerDate.all
  end

  # GET /photographer_dates/1
  # GET /photographer_dates/1.json
  def show
  end

  # GET /photographer_dates/new
  def new
    @photographer_date = PhotographerDate.new
  end

  # GET /photographer_dates/1/edit
  def edit
  end

  # POST /photographer_dates
  # POST /photographer_dates.json
  def create
    @photographer_date = PhotographerDate.new(photographer_date_params)

    respond_to do |format|
      if @photographer_date.save
        format.html { redirect_to @photographer_date, notice: 'Photographer date was successfully created.' }
        format.json { render :show, status: :created, location: @photographer_date }
      else
        format.html { render :new }
        format.json { render json: @photographer_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographer_dates/1
  # PATCH/PUT /photographer_dates/1.json
  def update
    respond_to do |format|
      if @photographer_date.update(photographer_date_params)
        format.html { redirect_to @photographer_date, notice: 'Photographer date was successfully updated.' }
        format.json { render :show, status: :ok, location: @photographer_date }
      else
        format.html { render :edit }
        format.json { render json: @photographer_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photographer_dates/1
  # DELETE /photographer_dates/1.json
  def destroy
    @photographer_date.destroy
    respond_to do |format|
      format.html { redirect_to photographer_dates_url, notice: 'Photographer date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photographer_date
      @photographer_date = PhotographerDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photographer_date_params
      params.require(:photographer_date).permit(:photographer_id, :date, :service_id)
    end
end

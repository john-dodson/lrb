class CatererDatesController < ApplicationController
  before_action :set_caterer_date, only: [:show, :edit, :update, :destroy]

  # GET /caterer_dates
  # GET /caterer_dates.json
  def index
    @caterer_dates = CatererDate.all
  end

  # GET /caterer_dates/1
  # GET /caterer_dates/1.json
  def show
  end

  # GET /caterer_dates/new
  def new
    @caterer_date = CatererDate.new
  end

  # GET /caterer_dates/1/edit
  def edit
  end

  # POST /caterer_dates
  # POST /caterer_dates.json
  def create
    @caterer_date = CatererDate.new(caterer_date_params)

    respond_to do |format|
      if @caterer_date.save
        format.html { redirect_to @caterer_date, notice: 'Caterer date was successfully created.' }
        format.json { render :show, status: :created, location: @caterer_date }
      else
        format.html { render :new }
        format.json { render json: @caterer_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caterer_dates/1
  # PATCH/PUT /caterer_dates/1.json
  def update
    respond_to do |format|
      if @caterer_date.update(caterer_date_params)
        format.html { redirect_to @caterer_date, notice: 'Caterer date was successfully updated.' }
        format.json { render :show, status: :ok, location: @caterer_date }
      else
        format.html { render :edit }
        format.json { render json: @caterer_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caterer_dates/1
  # DELETE /caterer_dates/1.json
  def destroy
    @caterer_date.destroy
    respond_to do |format|
      format.html { redirect_to caterer_dates_url, notice: 'Caterer date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caterer_date
      @caterer_date = CatererDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caterer_date_params
      params.require(:caterer_date).permit(:caterer_id, :date, :service_id)
    end
end

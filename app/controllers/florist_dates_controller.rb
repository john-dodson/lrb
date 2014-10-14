class FloristDatesController < ApplicationController
  before_action :set_florist_date, only: [:show, :edit, :update, :destroy]

  # GET /florist_dates
  # GET /florist_dates.json
  def index
    @florist_dates = FloristDate.all
  end

  # GET /florist_dates/1
  # GET /florist_dates/1.json
  def show
  end

  # GET /florist_dates/new
  def new
    @florist_date = FloristDate.new
  end

  # GET /florist_dates/1/edit
  def edit
  end

  # POST /florist_dates
  # POST /florist_dates.json
  def create
    @florist_date = FloristDate.new(florist_date_params)

    respond_to do |format|
      if @florist_date.save
        format.html { redirect_to @florist_date, notice: 'Florist date was successfully created.' }
        format.json { render :show, status: :created, location: @florist_date }
      else
        format.html { render :new }
        format.json { render json: @florist_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /florist_dates/1
  # PATCH/PUT /florist_dates/1.json
  def update
    respond_to do |format|
      if @florist_date.update(florist_date_params)
        format.html { redirect_to @florist_date, notice: 'Florist date was successfully updated.' }
        format.json { render :show, status: :ok, location: @florist_date }
      else
        format.html { render :edit }
        format.json { render json: @florist_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /florist_dates/1
  # DELETE /florist_dates/1.json
  def destroy
    @florist_date.destroy
    respond_to do |format|
      format.html { redirect_to florist_dates_url, notice: 'Florist date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_florist_date
      @florist_date = FloristDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def florist_date_params
      params.require(:florist_date).permit(:florist_id, :date, :service_id)
    end
end

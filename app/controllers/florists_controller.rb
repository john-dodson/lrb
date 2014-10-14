class FloristsController < ApplicationController
  before_action :set_florist, only: [:show, :edit, :update, :destroy]

  # GET /florists
  # GET /florists.json
  def index
    @florists = Florist.all
  end

  # GET /florists/1
  # GET /florists/1.json
  def show
  end

  # GET /florists/new
  def new
    @florist = Florist.new
  end

  # GET /florists/1/edit
  def edit
  end

  # POST /florists
  # POST /florists.json
  def create
    @florist = Florist.new(florist_params)

    respond_to do |format|
      if @florist.save
        format.html { redirect_to @florist, notice: 'Florist was successfully created.' }
        format.json { render :show, status: :created, location: @florist }
      else
        format.html { render :new }
        format.json { render json: @florist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /florists/1
  # PATCH/PUT /florists/1.json
  def update
    respond_to do |format|
      if @florist.update(florist_params)
        format.html { redirect_to @florist, notice: 'Florist was successfully updated.' }
        format.json { render :show, status: :ok, location: @florist }
      else
        format.html { render :edit }
        format.json { render json: @florist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /florists/1
  # DELETE /florists/1.json
  def destroy
    @florist.destroy
    respond_to do |format|
      format.html { redirect_to florists_url, notice: 'Florist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_florist
      @florist = Florist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def florist_params
      params.require(:florist).permit(:name)
    end
end

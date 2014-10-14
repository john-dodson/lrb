class CaterersController < ApplicationController
  before_action :set_caterer, only: [:show, :edit, :update, :destroy]

  # GET /caterers
  # GET /caterers.json
  def index
    @caterers = Caterer.all
  end

  # GET /caterers/1
  # GET /caterers/1.json
  def show
  end

  # GET /caterers/new
  def new
    @caterer = Caterer.new
  end

  # GET /caterers/1/edit
  def edit
  end

  # POST /caterers
  # POST /caterers.json
  def create
    @caterer = Caterer.new(caterer_params)

    respond_to do |format|
      if @caterer.save
        format.html { redirect_to @caterer, notice: 'Caterer was successfully created.' }
        format.json { render :show, status: :created, location: @caterer }
      else
        format.html { render :new }
        format.json { render json: @caterer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caterers/1
  # PATCH/PUT /caterers/1.json
  def update
    respond_to do |format|
      if @caterer.update(caterer_params)
        format.html { redirect_to @caterer, notice: 'Caterer was successfully updated.' }
        format.json { render :show, status: :ok, location: @caterer }
      else
        format.html { render :edit }
        format.json { render json: @caterer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caterers/1
  # DELETE /caterers/1.json
  def destroy
    @caterer.destroy
    respond_to do |format|
      format.html { redirect_to caterers_url, notice: 'Caterer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caterer
      @caterer = Caterer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caterer_params
      params.require(:caterer).permit(:name)
    end
end

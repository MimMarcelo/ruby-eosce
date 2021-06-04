class OscesController < ApplicationController
  before_action :set_osce, only: %i[ show edit update destroy ]

  # GET /osces or /osces.json
  def index
    @osces = Osce.all
  end

  # GET /osces/1 or /osces/1.json
  def show
  end

  # GET /osces/new
  def new
    @osce = Osce.new
  end

  # GET /osces/1/edit
  def edit
  end

  # POST /osces or /osces.json
  def create
    @osce = Osce.new(osce_params)

    respond_to do |format|
      if @osce.save
        format.html { redirect_to @osce, notice: "Osce was successfully created." }
        format.json { render :show, status: :created, location: @osce }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @osce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /osces/1 or /osces/1.json
  def update
    respond_to do |format|
      if @osce.update(osce_params)
        format.html { redirect_to @osce, notice: "Osce was successfully updated." }
        format.json { render :show, status: :ok, location: @osce }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @osce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /osces/1 or /osces/1.json
  def destroy
    @osce.destroy
    respond_to do |format|
      format.html { redirect_to osces_url, notice: "Osce was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_osce
      @osce = Osce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def osce_params
      params.require(:osce).permit(:title, :resume, :accept_comments, :fixed_station_order)
    end
end

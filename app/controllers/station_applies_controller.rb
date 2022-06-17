class StationAppliesController < ApplicationController
  before_action :set_station_apply, only: %i[ show edit update destroy ]

  # GET /station_applies or /station_applies.json
  def index
    @station_applies = StationApply.all
  end

  # GET /station_applies/1 or /station_applies/1.json
  def show
  end

  # GET /station_applies/new
  def new
    @station_apply = StationApply.new
  end

  # GET /station_applies/1/edit
  def edit
  end

  # POST /station_applies or /station_applies.json
  def create
    @station_apply = StationApply.new(station_apply_params)

    respond_to do |format|
      if @station_apply.save
        format.html { redirect_to station_apply_url(@station_apply), notice: "Station apply was successfully created." }
        format.json { render :show, status: :created, location: @station_apply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_applies/1 or /station_applies/1.json
  def update
    respond_to do |format|
      if @station_apply.update(station_apply_params)
        if params[:exam] then
          format.html { redirect_to exam_apply_url(params[:exam_apply_id]), notice: "Station apply respondida." }
        else
          format.html { redirect_to station_apply_url(@station_apply), notice: "Station apply was successfully updated." }
          format.json { render :show, status: :ok, location: @station_apply }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station_apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_applies/1 or /station_applies/1.json
  def destroy
    @station_apply.destroy

    respond_to do |format|
      format.html { redirect_to station_applies_url, notice: "Station apply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_apply
      @station_apply = StationApply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_apply_params
      params.require(:station_apply).permit(:exam_apply_id, :time_left, :finished, :station_template_id, :exam)
    end
end

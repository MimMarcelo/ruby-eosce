class StationTemplatesController < ApplicationController
  before_action :set_station_template, only: %i[ show edit update destroy ]

  # GET /station_templates or /station_templates.json
  def index
    # @station_templates = StationTemplate.order('updated_at desc').all
    @station_templates = current_user.station_templates.order('updated_at desc').all
  end

  # GET /station_templates/1 or /station_templates/1.json
  def show
  end

  # GET /station_templates/new
  def new
    if params[:schedule_id] then
      @schedule_id = params[:schedule_id]
    end
    @station_template = StationTemplate.new
    # @station_template.save
    # @questions = @station_template.questions # Question.all
  end

  # GET /station_templates/1/edit
  def edit
    @questions = @station_template.questions
  end

  # POST /station_templates or /station_templates.json
  def create
    @station_template = StationTemplate.new(station_template_params)
    
    respond_to do |format|
      if @station_template.save
        @user_station_template = UserStationTemplate.new
        @user_station_template.user_id = current_user.id
        @user_station_template.station_template_id = @station_template.id
        @user_station_template.owner = true
        if @user_station_template.save
          if params[:schedule_id]
            format.html { redirect_to add_station_path(params[:schedule_id], @station_template.id), notice: "Schedule was successfully created." }
          else
            format.html { redirect_to station_templates_url, notice: "Station template was created." }
            format.json { render :show, status: :created, location: @station_template }
          end
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @station_template.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_templates/1 or /station_templates/1.json
  def update
    respond_to do |format|
      if @station_template.update(station_template_params)
        format.html { redirect_to station_templates_url, notice: "Station template was successfully updated." }
        format.json { render :show, status: :ok, location: @station_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_templates/1 or /station_templates/1.json
  def destroy
    @station_template.destroy
    respond_to do |format|
      format.html { redirect_to station_templates_url, notice: "Station template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_template
      @station_template = StationTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_template_params
      params.require(:station_template).permit(:name, :resume, :procedure, :evaluation, :score, :minutes, :level)
    end
end

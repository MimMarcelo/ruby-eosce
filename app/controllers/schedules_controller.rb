class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy add_station remove_station]

  # GET /schedules or /schedules.json
  def index
    # @schedules = Schedule.order('updated_at desc').all
    # Lista apenas os Schedules criados pela própria pessoa logada
    @schedules = current_user.schedules
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit

    if @schedule.station_templates.count == 0
      @station_templates = StationTemplate.order('updated_at desc').all
    else
      # Retorna a lista das Station que ainda não estão associadas ao Schedule
      @station_templates = StationTemplate.where(
        'id NOT IN (?)', @schedule.station_templates.pluck(:station_template_id)
        ).order('updated_at desc')
    end
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        if params[:leave] == t("save")
          format.html { redirect_to schedules_url, notice: "Schedule was successfully created." }
        else
          format.html { redirect_to edit_schedule_path(@schedule), notice: "Schedule was successfully created." }
        end
        @user_schedule = UserSchedule.new
        @user_schedule.user_id = current_user.id
        @user_schedule.schedule_id = @schedule.id
        @user_schedule.owner = true
        if @user_schedule.save
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { redirect_to edit_schedule_path(@schedule), notice: "Schedule was successfully created." }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to schedules_url, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /schedule_add/1 or /schedule_add/1.json
  def add_station
    
    @schedule_stations = ScheduleStation.new
    @schedule_stations.station_template_id = params[:station_template_id]
    @schedule_stations.schedule_id = params[:id]
    @schedule_stations.save
    redirect_to edit_schedule_path(@schedule)
  end

  def create_station
    redirect_to edit_station_template_path(params[:id])
  end

  # GET /schedule_remove/1 or /schedule_remove/1.json
  def remove_station

    schedule_station = @schedule.schedule_stations.where("station_template_id=?", params[:station_template_id])
    if schedule_station
      if ScheduleStation.delete(schedule_station)
        redirect_to edit_schedule_path(@schedule)
      end
    end
    # redirect_to edit_schedule_path(@schedule)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:leave, :station_template_id, :name, :resume, :fixed_station_sequence)
    end
end

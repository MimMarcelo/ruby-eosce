class ExamAppliesController < ApplicationController
  before_action :set_exam_apply, only: %i[ show edit update destroy ]

  # GET /exam_applies or /exam_applies.json
  def index
    @exam_applies = ExamApply.all
  end

  # GET /exam_applies/1 or /exam_applies/1.json
  def show
    @exam = Exam.find(@exam_apply.exam_id)
    @schedule = Schedule.find(@exam.schedule_id)
    
    @exam_apply.station_applies = StationApply.where("exam_apply_id=?", @exam_apply.id)
    if @exam_apply.station_applies.count == 0 then
      @schedule.station_templates.each do |station|
        @station_apply = StationApply.new
        @station_apply.exam_apply_id = @exam_apply.id
        @station_apply.station_template_id = station.id
        @station_apply.time_left = station.minutes
        @station_apply.finished = false
        @station_apply.save
        @exam_apply.station_applies.push(@station_apply)
      end
    end
    @exam_apply.station_applies.each do |station|
      if(station.finished) then
        @exam_apply.station_turn += 1
      end
    end
  end

  # GET /exam_applies/new
  def new
    @exam_apply = ExamApply.new
  end

  # GET /exam_applies/1/edit
  def edit
  end

  # POST /exam_applies or /exam_applies.json
  def create
    @exam_apply = ExamApply.new(exam_apply_params)

    respond_to do |format|
      if @exam_apply.save
        format.html { redirect_to exam_apply_url(@exam_apply), notice: "Exam apply was successfully created." }
        format.json { render :show, status: :created, location: @exam_apply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam_apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_applies/1 or /exam_applies/1.json
  def update
    respond_to do |format|
      if @exam_apply.update(exam_apply_params)
        format.html { redirect_to exam_apply_url(@exam_apply), notice: "Exam apply was successfully updated." }
        format.json { render :show, status: :ok, location: @exam_apply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam_apply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_applies/1 or /exam_applies/1.json
  def destroy
    @exam_apply.destroy

    respond_to do |format|
      format.html { redirect_to exam_applies_url, notice: "Exam apply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_apply
      @exam_apply = ExamApply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_apply_params
      params.require(:exam_apply).permit(:exam_id, :student_name, :student_email, :student_id, :station_turn)
    end
end

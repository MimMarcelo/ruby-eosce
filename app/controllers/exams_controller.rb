class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show edit update destroy ]

  # GET /exams or /exams.json
  def index
    #@exams = Exam.all
    @exams = current_user.exams.order('updated_at desc').all
  end

  # GET /exams/1 or /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
    #@exam.user = current_user
    @exam.schedule = Schedule.find(params[:schedule_id])
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams or /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to exams_url, notice: "Exam was successfully created." }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to exams_url, notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url, notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:user_id, :schedule_id, :start, :end)
    end
end

class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ edit update destroy ]

  # GET /exams or /exams.json
  def index
    #@exams = Exam.all
    @exams = current_user.exams.order('updated_at desc').all
  end

  # GET /exams/1 or /exams/1.json
  def show
    
    parts = params[:id].split("-")
    @user = User.find(Exam.decode(parts[0]))
    @schedule = Schedule.find(Exam.decode(parts[1]))
    @exam = Exam.find(Exam.decode(parts[2]))
    # if @user = nil || @schedule = nil || @exam = nil then
    #   respond_to do |type|
    #     type.html { redirect_to "errors/error_404", :status => 404 }
    #     type.json  { render :nothing => true, :status => 404 }
    #   end
    # end
    if DateTime.now < @exam.start || DateTime.now > @exam.end then
      respond_to do |type|
        type.html { redirect_to "errors/error_404", :status => 404 }
        type.json  { render :nothing => true, :status => 404 }
      end
    end

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

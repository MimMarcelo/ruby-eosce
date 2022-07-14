class StationTemplateQuestionsController < ApplicationController
  def new
    @question = Question.new
    @station_id = params[:station_id]
  end

  def index
    @station = StationTemplate.find(params[:station_id])
    @sts = StationTemplateQuestion.where.not(station_template: @station)
    #@questions = Question.where(id: @sts)
    @questions = Question.all
  end

  def create
    @station = StationTemplate.find(params[:station_id])
    @question = Question.find(params[:question_id])
    @st = StationTemplateQuestion.new
    @st.station_template_id = @station.id
    @st.question_id = @question.id
    @st.save
    redirect_to station_template_questions_path(@station)
  end

  def destroy
    @station = StationTemplate.find(params[:station_id])
    @st = StationTemplateQuestion.where(station_template: params[:station_id], question: params[:question_id])
    @st.each do |s|
      s.destroy
    end
    redirect_to station_template_questions_path(@station)
  end
end

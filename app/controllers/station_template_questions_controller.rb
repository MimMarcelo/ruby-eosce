class StationTemplateQuestionsController < ApplicationController
  def new
    @question = Question.new
    @station_id = params[:station_id]
  end
end

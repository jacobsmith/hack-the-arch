class AnonymousQuestionsController < ApplicationController
  def index
    @questions = AnonymousQuestion.where(active: true)
  end

  def admin_index
    @questions = AnonymousQuestion.all
  end

  def submit
    params['anonymous_question']['anonymous_response'].each do |question_id, answer|
      AnonymousResponse.create(question_id: question_id, answer: answer)
    end
    flash[:success] = 'Thank you for submitting the questionnaire.'
    redirect_to root_path
  end

  def new
  end

  def create
  end
end

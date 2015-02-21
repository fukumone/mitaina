class EvaluationsController < ApplicationController

  # Ajax PATCH
  def good
    common(1)
  end

  # Ajax PATCH
  def bad
    common(2)
  end

  private
  def common(value)
    evaluation = Evaluation.find_or_create_by(user_id: params[:user_id], comment_id: params[:comment_id])

    if evaluation.status == value
      evaluation.status = 0 #評価保留
    else
      evaluation.status = value
    end
    evaluation.save!

    count = Comment.find(params[:comment_id]).total_evaluation(evaluation.status)
    render json: { count: count }
  end
end

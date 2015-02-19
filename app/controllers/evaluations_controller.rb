class EvaluationsController < ApplicationController

  # Ajax PATCH
  def good
    common(1)
  end

  # Ajax PATCH
  def bad
    common(-1)
  end

  private
  def common(value)
    evaluation = Evaluation.find_or_create_by(user_id: params[:user_id], comment_id: params[:comment_id])
    comment = Comment.find(params[:comment_id]).evaluations.size
    render json: { status: comment }
  end
end

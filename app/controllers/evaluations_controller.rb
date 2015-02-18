class EvaluationsController < ApplicationController

  # Ajax PATCH
  def good
    evaluation = Evaluation.find_by(comment_id: params[:comment_id])
    status = evaluation.status
    evaluation.status = status + 1
    evaluation.save!
    render json: { status: evaluation.status }
  end

  # Ajax PATCH
  def bad
    evaluation = Evaluation.find_by(comment_id: params[:comment_id])
    status = evaluation.status
    evaluation.status = status - 1
    evaluation.save!
    render json: { status: evaluation.status }
  end
end

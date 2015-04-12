class TopController < ApplicationController
  skip_before_action :authorize

  def index
    @comments = Comment.preload(:evaluations).select('id, sentence').limit(20).order("id desc")
  end
end

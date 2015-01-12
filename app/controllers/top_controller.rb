class TopController < ApplicationController
  def index
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash.notice = "「みたいな」言葉のつぶやきに成功みたいな(￣▽￣)ノ＿彡☆バンバン！"
      redirect_to :top_index
    else
      flash.alert = "「みたいな」言葉のつぶやきに失敗みたいな....ｱﾜ((ﾟﾟддﾟﾟ ))ﾜﾜ!!"
      render "index"
    end
  end

  def search
  end

  private
  def comment_params
    params.require(:comment).permit(:sentence)
  end
end

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.prototype_id = params[:prototype_id]
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      # エラー処理
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
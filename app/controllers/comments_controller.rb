class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])

    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.user_id

    if @comment.save
      redirect_to @message, notice: "Comment created!"
    else
      render :new
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end

class CommentsController < ApplicationController

  def new
    @place = params[:place]
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(comment_params)
    @user_id = session[:user_id]
    @comment.user_id = @user_id
    if @comment.save
    
      redirect_to "/places/#{@comment[:place_id]}"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :place_id)
  end
end

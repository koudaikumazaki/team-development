class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "コメントを(140文字以内で)入力してください。"
      redirect_back(fallback_location: post_path(@post)) 
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end  
end
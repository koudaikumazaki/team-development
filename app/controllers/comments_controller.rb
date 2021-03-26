class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      flash[:error] = "コメントを(140文字以内で)入力してください。"
      @post = Post.find(params[:post_id])
      @comments = @post.comments.includes([:user])
      render 'posts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment).merge(params.permit(:post_id))
  end  
end
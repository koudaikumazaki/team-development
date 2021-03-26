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
  
  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comments = @post.comments.includes([:user])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "コメントを(140文字以内)で入力してください。"
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
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :load_post, only: [:edit, :update, :destroy]
  before_action :load_comment, only: [:edit, :update, :destroy]
  
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
    @comments = @post.comments.includes([:user])
  end
  
  def update
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
  
  def destroy
    @comment.destroy!
    redirect_to post_path(@post)    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment).merge(params.permit(:post_id))
  end  
  
  def correct_user
    comment = Comment.find(params[:id])
    if current_user.id != comment.user_id
      flash[:notice] = '権限がありません'
      redirect_to root_path
    end
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
  
  def load_comment
    @comment = @post.comments.find(params[:id])
  end

end
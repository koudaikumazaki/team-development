class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :permit_update_delete, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index          
    @posts = Post.all                        
  end

  def show
    @comments = @post.comments.includes([:user]).order(created_at: :asc)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render '/posts/new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:content, :created_at)
  end

  def permit_update_delete
    @post= Post.find(params[:id])
    unless user_signed_in? && @post.user.id == current_user.id
      redirect_to root_path
    end
  end

  def set_post
    @post= Post.find(params[:id])
  end

end
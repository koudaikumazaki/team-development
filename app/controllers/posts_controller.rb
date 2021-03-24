class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :permit_update_delete, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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

  def update
    
  end

  def edit
    
  end
  
  def destroy
    
  end

  private
  def post_params
    params.require(:post).permit(:content, :created_at, :user_id)
  end

  def permit_update_delete
    @post = Post.find(params[:id])
    unless user_signed_in? && @post.user_id == current_user.id
      redirect_to root_path
    end
  end
end
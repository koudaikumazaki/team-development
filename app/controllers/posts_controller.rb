class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  # before_action :permit_update_delete, only: [:edit, :update, :destroy]
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :created_at)
  end

end

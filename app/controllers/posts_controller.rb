class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: session[:user_id], title: params[:post][:title],
                     body: params[:post][:body])
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end
end

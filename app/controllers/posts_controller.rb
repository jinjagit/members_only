class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to login_path
    end
  end

  def create
    post_params
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

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end

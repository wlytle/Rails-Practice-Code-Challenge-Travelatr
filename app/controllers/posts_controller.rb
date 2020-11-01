class PostsController < ApplicationController
  def show
    get_post
  end

  def new
    @post = Post.new
    bloggers
    destinations
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path @post
    else
      bloggers
      destinations
      render :new
    end
  end

  def like
    get_post
    @post.like
    redirect_to post_path @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def bloggers
    @bloggers = Blogger.all
  end

  def destinations
    @destinations = Destination.all
  end
end

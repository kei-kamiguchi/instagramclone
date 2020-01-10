class PostsController < ApplicationController

  def index
    @posts=Post.all
  end

  def new
    if params[:back]
      @post = post.new(post_params)
    else
      @post=Post.new
    end
  end

  def create
    @post=Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿しました"
    else
      render 'edit'
    end
  end

  def confirm
    @post=Post.find(params[:id])
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end

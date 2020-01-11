class PostsController < ApplicationController

  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    if params[:back]
      @post = Post.new(post_params)
      render 'new'
      return
    end

    @post=current_user.posts.build(post_params)

    if @post.save
      PostMailer.post_mail().deliver
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
    @post=current_user.posts.build(post_params)
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

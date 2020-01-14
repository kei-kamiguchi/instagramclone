class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "ユーザー「#{@user.name}」を作成しました"
    else
      render "new"
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to root_path
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.image?
      @user.update_attributes(image: params[:image])
      redirect_to user_path(@user), notice: "プロフィール画像を変更しました"
      return
    end

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザー#{@user.name}を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザーが登録されました'
      redirect_to users_path
    else
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: 'ユーザーを削除しました'
    else
      redirect_to users_path, alert: '削除に失敗しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :email, :password, :password_confirmation)
  end
end
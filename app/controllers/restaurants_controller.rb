class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save!  # !を追加してエラーを確認
      flash[:notice] = '料理を追加しました'
      redirect_to restaurants_path
    else
      flash.now[:alert] = '料理の追加に失敗しました'
      render :new
    end
  end
  
  def destroy
  if current_user&.admin?
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: '料理を削除しました'
  else
    redirect_to restaurants_path, alert: '権限がありません'
  end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :price)
  end
end
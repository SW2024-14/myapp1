class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items.includes(:restaurant)
  end

  def add_item
    @cart_item = current_cart.cart_items.find_or_initialize_by(restaurant_id: params[:restaurant_id])
    quantity = params[:quantity].to_i || 1
    @cart_item.quantity = quantity
    
    if @cart_item.save
      redirect_to cart_path, notice: 'カートに追加しました'
    else
      redirect_to restaurants_path, alert: '追加に失敗しました'
    end
  end
  
  def remove_from_cart
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: '商品をカートから削除しました'
  end
  
  # app/controllers/carts_controller.rb
  def purchase
  @cart = current_cart
  if @cart.cart_items.any?
    # ここで実際の購入処理を実装します（例：注文の作成、在庫の更新など）
    @cart.cart_items.destroy_all  # カート内のアイテムをクリア
    redirect_to restaurants_path, notice: '購入が完了しました。ありがとうございます！'
  else
    redirect_to cart_path, alert: 'カートが空です。'
  end
  end
end
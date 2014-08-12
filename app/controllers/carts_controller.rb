class CartsController < ApplicationController

  def update
    session[:cart] ||= {}
    cart = session[:cart]
    product_id = params[:product_id]

    if product_id.present?
      cart[product_id] ||= 0
      cart[product_id] += 1
    end
    redirect_to cart_path, alert: 'Item was added to cart'
  end

  def show
    @order = Order.new

    session[:cart].each do |product_id, quantity|
      @order.line_items.build(
        product: Product.find(product_id),
        quantity: quantity
      )
    end

  end

end

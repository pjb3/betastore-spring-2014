class OrdersController < ApplicationController

  def new
    @order = Order.from_cart(session[:cart])
    @order.build_credit_card
    @order.build_shipping_address
  end

  def update
    cart_params = params[:order][:line_items_attributes]
    logger.debug "cart_params: #{cart_params.values.inspect}"
    logger.debug "cart: #{session[:cart].inspect}"

    new_cart = {}

    for item in cart_params.values
      new_cart[item["product_id"]] = item["quantity"].to_i
    end

    logger.debug "new_cart: #{new_cart.inspect}"
    session[:cart] = new_cart

    redirect_to cart_path, notice: 'Your cart was updated'
  end
end

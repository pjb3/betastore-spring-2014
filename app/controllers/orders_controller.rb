class OrdersController < ApplicationController
  def update
    cart_params = params[:order][:line_items_attributes]
    logger.debug "cart_params: #{cart_params.values.inspect}"
    logger.debug "cart: #{session[:cart].inspect}"

    new_cart = {}

    for item in cart_params
      # something
    end

    logger.debug "new_cart: #{new_cart.inspect}"
    #session[:cart] = new_cart

    redirect_to cart_path, notice: 'Your cart was updated'
  end
end

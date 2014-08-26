class OrdersController < ApplicationController

  def new
    @order = Order.from_cart(session[:cart])
    @order.build_credit_card
    @order.build_shipping_address
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
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

private
  def order_params
    params.permit(
      :line_items_attributes =>
        [:product_id, :quantity],
      :credit_card_attributes =>
        [:card_number],
      :shipping_address_attributes =>
        [:street, :city, :state, :zip])
  end
end

class OrdersController < ApplicationController
    def index 
      # get orders for the current user from the database
      @orders = Order.where(user_id: current_user.id)
    end
  
    def create
    #   @order = Order.create(user_id: current_user.id)
    #   @order.order_items.create(product_id: params[:product_id], quantity: params[:quantity])
    #   redirect_to_index_path
    end
  
    def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items
    end
  
    # def destroy
    #   @order = Order.find(params[:id])
    #   @order.destroy
    #   redirect_to orders_path
    # end
  end
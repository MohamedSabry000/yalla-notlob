class OrdersController < ApplicationController
    def index 
      # get orders for the current user from the database
      @orders = Order.where(user_id: current_user.id)
    end

    def new
      # @order = Order.new

    end
  
    def create
      order_type=params[:order_type]
      restaurant_name=params[:restaurant_name]
      img=params[:img]


      @order = Order.create(user_id: current_user.id,total:0,order_type:order_type,restaurant_name:restaurant_name,status:"wating")
      redirect_to orders_index_path
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
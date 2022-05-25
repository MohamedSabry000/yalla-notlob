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

      redirect_to orders_path
    end

    def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items
    end

    def addFriendtoOrder
      friend_email = params[:friend_email]
      @friends=Friend.find_by(email: friend_email,user:current_user.id)
      @friendid=@friends.id
      # not use user directly in case he writes email not of his friends
      @user=User.find_by(email: @friends.email)

      respond_to do |format|
        format.html
        format.json {render json: [@friendid, @user]}
      end
    end

    # def destroy
    #   @order = Order.find(params[:id])
    #   @order.destroy
    #   redirect_to orders_path
    # end
  end
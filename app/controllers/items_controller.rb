class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
      @item = Item.new
  end

  def create
    p "----------------create-----------------"
    @order = Order.find(params[:order_id])
    @item = @order.items.create(item_params)
    @item.user_id = current_user.id
    @item.save

    # ActionCable.server.broadcast "order_#{params[:order_id]}",
      # id: @item.id,
      # # full_name: @item.full_name,
      # name: @item.name,
      # amount: @item.amount,
      # price: @item.price,
      # comment: @item.comment,
      # action: "add"
    redirect_to order_path(@order)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      ActionCable.server.broadcast "order_#{params[:order_id]}",
      id: @item.id,
      full_name: @item.full_name,
      name: @item.name,
      amount: @item.amount,
      price: @item.price,
      comment: @item.comment,
      action: "edit"
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @item = @order.items.find(params[:id])

    @item.destroy

    ActionCable.server.broadcast "order_#{params[:order_id]}",
      id: @item.id,
      action: "delete"

    redirect_to @order
  end


  private
    def item_params
      params.require(:item).permit(:user, :name, :amount, :price, :comment)
    end

    def set_item
      @order = Order.find(params[:order_id])
      @item = @order.items.find(params[:id])
    end
end

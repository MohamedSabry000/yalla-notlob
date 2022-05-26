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
      # img=params[:img]

      @listofIds = session[:passed_variable]
      @get_value = @listofIds

      @order = Order.create(user_id: current_user.id,total:0,order_type:order_type,restaurant_name:restaurant_name,status:"waiting")
      if @order.save

        if @get_value != nil
          logger.info("@get_value is not nil")
          @get_value.each do |currentfriendid|

            @order_friend=OrderPartispant.new
            friend_email = Friend.find(currentfriendid).email
            friend_as_user = User.find_by(email: friend_email)

            @order_friend.user_id = friend_as_user.id      # currentfriendid
            @order_friend.order_id= @order.id

            if @order_friend.save
              p "--------------------- friend is added to order ---------------------"
            else
              p "--------------------- friend is not added to order-------------------"
              render :new
            end
          end

          # @order.order_friends.each do |order_friend|
          #   Notification.notify_invite(order_friend)
          # end

          p "---------------------- order is added ----------------------"
        else
          p "---------------------- get_value=nil ----------------------"
          redirect_to @order
        end
      else
        p "------------------- order is not added -------------------"
        render :new
      end
    end

    def show
      @order = Order.find(params[:id])
      logger.info(@order)
      @order_items = @order.items
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

    def addGrouptoOrder
      group_name = params[:group_name]
      @group = Group.find_by(user_id: current_user.id,name:group_name)

      # 2 arrays 1 for friends ids and another for same user instance
      @friendsingroup = {friends: []}
      @friendsingroupids={friendsid: []}

      @results = @group.group_friends.each do |group_friend|

        @friendsingroupids[:friendsid] <<  group_friend.friend.id

        @users=User.find_by(email:group_friend.friend.email)
        @friendsingroup[:friends] <<  @users

      end

      respond_to do |format|
        format.html
        format.json { render json: [@friendsingroupids, @friendsingroup]}
      end
    end

    def order_friend_params
      @listofIds =params[:formData]
      session[:passed_variable] = @listofIds
    end
    # def destroy
    #   @order = Order.find(params[:id])
    #   @order.destroy
    #   redirect_to orders_path
    # end
  end
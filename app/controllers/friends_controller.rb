class FriendsController < ApplicationController

  def index 
   @arrs = [] 
       @alls = User.all
        @user = User.find(current_user.id)
           @fris =  Friendship.where(user_id: @user.id)

  end


  def search 
    @alls = User.all
      @item = params[:q]
      @alls.each do |all|     
      if  @item == all.email 
        if  Friendship.new(user_id:current_user.id , friend_id:all.id).save && Friendship.new(user_id:all.id , friend_id:current_user.id).save  
          @friends = Friendship.all 
           respond_to do |format|
             format.js 
           end      
        end
      end
    end 
end

      # this is destroy  !!!!!
    def destroy
        @deleteitemInUser =  Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
        @deleteitemInUser1 =  Friendship.find_by(user_id:params[:id] , friend_id: current_user.id)

         @deleteitemInUser.destroy
         @deleteitemInUser1.destroy


         respond_to do |format|
          format.js 
           end
    end
   
end



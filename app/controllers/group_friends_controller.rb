class GroupFriendsController < ApplicationController

    def new
        @group_friend = GroupFriend.new
    end

    def create
        
        friend_query_set = Friend.where(email: group_friends_params.require(:friend_email), user_id: current_user.id)  # user_id = owner of the friend
        # To ensure friend exists and user has theim as friend
        if friend_query_set.count > 0
           
            friend = friend_query_set[0]
            
            # Check if friend is already added to that group
            group_friend_exists = GroupFriend.find_by(group_id: group_friends_params.require(:group_id), friend_id: friend.id)
            if group_friend_exists
               
                redirect_to group_path(group_friends_params.require(:group_id)), alert: "Friend is already added to the group"
                return
            end
            @group_friend = GroupFriend.new
            @group_friend.group_id  = group_friends_params.require(:group_id)
            
      
            @group_friend.friend_id = friend.id

            if @group_friend.save
              
                redirect_to group_path(group_friends_params.require(:group_id)), notice: "Friend added successfully"
            else
                
                render :new
            end

        else
            redirect_to group_path(group_friends_params.require(:group_id)), alert: "You don't have this friend"
        end 
    end

    def destroy
        @group = Group.find(params[:group_id])
        @group_friend = @group.group_friends.find(params[:id])
        @group_friend.destroy
        redirect_to group_path(params[:group_id]), notice: "Friend deleted successfully"
    end

    private
    def group_friends_params
        # puts '-------------->>>>>'
        # puts params
        # puts '--------------<<<<<'
        params.permit(:friend_email, :group_id)
    end

end

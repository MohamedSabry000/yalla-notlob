class GroupsController < ApplicationController
    def index
        @groups = Group.where(user_id: current_user.id)
    end

    def show
        @group = Group.find(params[:id])
        # puts @group.user.full_name

        @groups = Group.where(user_id: current_user.id)
        # @group_members = @group.group_friends

        render :index
    end

    def new
        @group = Group.new
    end

    def create
        # Check if group name exists
        group_name = group_params.require(:group_name)
        group_exists = false
        current_user.groups.each do |group|
            if group.name == group_name
                group_exists = true
                break
            end
        end
        if group_exists
            redirect_to groups_path, alert: "Group already exists"
            return
        end

        @group = Group.new(name: group_params.require(:group_name))

        @group.user_id = current_user.id

        if @group.save
            redirect_to action: "groups"
        else
            redirect_to groups_path, alert: "Can't create group!"
        end
    end

    def destroy
        @group = Group.find(params[:id])

        @group.destroy
    
        redirect_to action: "index"
    end

    private
    def group_params
        # puts '-------------->>>>>'
        # puts params
        # puts '-------------->>>>>'
        params.permit(:group_name)
    end

end

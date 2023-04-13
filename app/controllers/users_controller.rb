class UsersController < ApplicationController
    # before_action :set_user, only: %i[ show edit update destroy ]

    def index
        @users = User.all;
    end
  
    def show
      
        @user = User.find(params[:id])
        @current_user = current_user
        @rooms = Room.public_rooms
        # @users = current_user.friends #friends 
        # @users = User.all_except(@current_user)
        @room = Room.new
        @message = Message.new
        # @room_name = get_name(@user, @current_user)
        @single_room = Room.where(name: @room_name).first 
        @messages = @single_room.messages
    
        render "rooms/index"
      end

    #   private

    #   def get_name(user1, user2)
    #     users = [user1, user2].sort
    #     "private_#{users[0].id}_#{users[1].id}"
    #   end

    #   def user_params
    #     params.require(:user).permit(:firstname, :lastname, :username, :email, :image)
    #   end
end
      
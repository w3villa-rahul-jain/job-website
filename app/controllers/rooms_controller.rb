class RoomsController < ApplicationController

    def index
      @current_user = current_user
      redirect_to '/signin' unless @current_user
      @rooms = Room.public_rooms
      @users = User.all_except(@current_user)
      @room = Room.new
    end

    

    def create
        @room = Room.create(name: params["room"]["name"])
        # render partial: "layouts/new_room_form"
    end

    # def show
    #   @current_user = current_user
    #   @message = Message.new
    #   @single_room = Room.find(params[:id])
    #   @single_room = Room.find(params[:id]) if params[:room_id]
    #   @rooms = Room.public_rooms
    #   @users = User.all_except(@current_user)
    #   @room = Room.new
    #   @messages = @single_room.messages
    
    #   render "index"
    #   end

      def show
        @current_user = current_user
        @single_room = Room.find(params[:id])
        @rooms = Room.public_rooms
        @users = User.all_except(@current_user)
        @room = Room.new
        @message = Message.new
        @messages = @single_room.messages
      
        render "index"
      end
  end
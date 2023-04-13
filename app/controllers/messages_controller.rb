class MessagesController < ApplicationController

    def index
        @messages = Room.find_by(id: params[:room_id]).messages
    end
    def create
      @current_user = current_user
      @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    end
  
    private
  
    def msg_params
      params.require(:message).permit(:content)
    end
  end
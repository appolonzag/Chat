class MessagesController < ApplicationController
  def create
    @new_message = current_user&.messages&.build(strong_params)
    @current_room = Room.find(strong_params[:room_id])


    if @new_message&.save
      flash[:notice] = "New message! From: #{@current_room.title}, Message: #{@new_message.body} "
      @new_message.broadcast_append_to @new_message.room
    end
  end

  private

  def strong_params
    params.require(:message).permit(:room_id, :body)
  end
end

class MessagesController < ApplicationController
  before_action :set_group
  before_action :authenticate_user!


  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = @group.messages.new(message_params)

    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(@group)}
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render 'index'
    end
  end

  private
    def message_params
      params.require(:message).permit(:message).merge(user_id: current_user.id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end
end

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine
  before_action { authorize (@message || Message)}

  def create
    the_message = @routine.messages.new(role: params[:query_role])
    # api_messages_array = [{ role: "system", content: @routine.prompt }]

    if the_message.save
      content = ChatService.new(the_message, @routine).get_content

      redirect_to routine_path(@routine), notice: "Message created successfully."
    else
      redirect_to routine_path(@routine), alert: "Failed to create the message."
    end
  end

  private

  def set_routine
    @routine = Routine.find(params[:routine_id])
  end
end

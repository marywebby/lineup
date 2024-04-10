class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine

  def create
    @routine.messages.create(message_params)

    

    # todo: integrate with chat gpt using @routine.prompt for the system message
    # [
    #   { role: "system", content: "You are a skincare specialist who is helping someone organize their routine products......" }, # @routine.prompt
    #   { role: "user", content: "fdfdafd" },
    #   { role: "assistant", content: "chat gpt stuff" },
    #   ....
    # ]
    # add assistant response
  end

  private

  def set_routine
    @routine = Routine.find(params[:routine_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

end

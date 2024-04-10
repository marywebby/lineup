class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_routine

  def create
    the_message = @routine.messages.new(role: params[:query_role])

    if the_message.save
      # Prepare and make the API call to OpenAI
      api_messages_array = [{ role: "system", content: @routine.prompt }]
      client = OpenAI::Client.new(access_token: Rails.application.credentials.open_ai_api_key)
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: api_messages_array,
          temperature: 0.7
        }
      )

      # Process the response and save the new message
      content = response.dig('choices', 0, 'message', 'content') # Adjust based on actual response structure
      @routine.messages.create(role: "assistant", content: content)

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

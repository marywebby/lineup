class ChatService
  attr_reader :message, :routine

  def initialize(message, routine)
    @message = message
    @routine = routine
  end

  def get_content
    api_messages_array = [{ role: "system", content: @routine.prompt }]
    client = OpenAI::Client.new(access_token: Rails.application.credentials.open_ai_api_key)
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: api_messages_array,
        temperature: 0.7
      }
    )
    content = response.dig('choices', 0, 'message', 'content')
    @routine.messages.create(role: "assistant", content: content)
  end
end

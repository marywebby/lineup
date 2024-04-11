class ChatService
  attr_reader :message, :routine

  def initialize(message:, routine:)
    @message = message
    @routine = routine
  end

  def call
    routine_prompt = routine.is_a?(Routine) ? routine.prompt : "Routine prompt not available."

    messages = [
      { role: "system", content: routine }, # Use routine's prompt method to get a string
      { role: "user", content: message } # 'message' should also be a string
    ]

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: messages, # Required.
        temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  private

  def client
    @_client ||= OpenAI::Client.new(access_token: Rails.application.credentials.open_ai_api_key)
  end
end

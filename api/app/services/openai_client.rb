# frozen_string_literal: true

class OpenaiClient
  def initialize(model = 'gpt-3.5-turbo')
    @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    @model = model
  end

  def send_question(context)
    messages = [
      { role: 'user', content: context }
    ]

    response =
      @client.chat(
        parameters: {
          model: @model,
          messages:
        }
      )

    response.dig('choices', 0, 'message', 'content')
  end

  def model_list
    models = @client.models.list
    models['data'].map do |model|
      p model
      {
        id: model['id'],
        owned_by: model['owned_by'],
        root: model['root']
      }
    end
  end
end

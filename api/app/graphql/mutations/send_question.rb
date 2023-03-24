# frozen_string_literal: true

module Mutations
  class SendQuestion < Mutations::Base
    description '質問送信'

    argument :question, String, required: true

    field :answer, String, null: false

    def resolve(question:)
      answer = OpenaiClient.new.send_question(question)

      {
        answer:
      }
    end
  end
end

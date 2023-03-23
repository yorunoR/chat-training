module Mutations
  class SaveAnswer < Mutations::Base
    description '回答保存'

    argument :question, String, required: true
    argument :answer, String, required: true

    field :answer_history, Types::AnswerHistoryType, null: false

    def resolve(question:, answer:)
      current_user = context[:current_user]

      answer_history =
        current_user.answer_histories.create!(
          user: current_user,
          question: question,
          answer: answer
        )

      {
        answer_history: answer_history
      }
    end
  end
end

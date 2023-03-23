# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :activated, Boolean, null: false
    field :email, String
    field :name, String
    field :uid, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :answer_histories, [Types::AnswerHistoryType], '回答履歴一覧', null: false
    def answer_histories
      object.answer_histories.order(id: 'DESC')
    end
  end
end

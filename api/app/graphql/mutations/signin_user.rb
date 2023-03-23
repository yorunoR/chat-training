# frozen_string_literal: true

module Mutations
  class SigninUser < Mutations::BaseMutation
    description 'サインイン'

    field :user, Types::UserType, null: false

    def resolve
      uid = context[:uid]
      name = context[:name]
      email = context[:email]

      user = User.find_by(uid:)
      user = User.create!(uid:, email:, name:, activated: true) if user.blank?

      {
        user:
      }
    end
  end
end

module Mutations
  class SigninUser < Mutations::BaseMutation
    description 'サインイン'

    field :user, Types::UserType, null: false

    def resolve
      uid = context[:uid]
      name = context[:name]
      email = context[:email]

      user = User.find_by(uid: uid)
      user = User.create!(uid: uid, email: email, name: name, activated: true) if user.blank?

      {
        user: user
      }
    end
  end
end

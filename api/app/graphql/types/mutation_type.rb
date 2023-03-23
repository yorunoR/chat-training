module Types
  class MutationType < Types::BaseObject
    field :signinUser, mutation: Mutations::SigninUser
  end
end

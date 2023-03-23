module Types
  class MutationType < Types::BaseObject
    field :signinUser, mutation: Mutations::SigninUser
    field :sendQuestion, mutation: Mutations::SendQuestion
    field :saveAnswer, mutation: Mutations::SaveAnswer
  end
end

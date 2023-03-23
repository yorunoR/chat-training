module Mutations
  class Base < Mutations::BaseMutation
    def authorized?
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
    end
  end
end

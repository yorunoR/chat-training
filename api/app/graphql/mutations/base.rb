# frozen_string_literal: true

module Mutations
  class Base < Mutations::BaseMutation
    def authorized?(_args)
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]

      true
    end
  end
end

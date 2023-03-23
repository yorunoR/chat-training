module Queries
  class Base < GraphQL::Schema::Resolver
    def authorized?
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
    end
  end
end

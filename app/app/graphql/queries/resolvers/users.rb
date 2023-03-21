module Queries
  module Resolvers
    class Users < GraphQL::Schema::Resolver
      type [Types::UserType], null: false
      description "Userの一覧取得"
 
      def resolve
        ::User.all
      end
    end
  end
end

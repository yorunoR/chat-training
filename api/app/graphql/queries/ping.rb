module Queries
  class Ping < GraphQL::Schema::Resolver
    type String, null: false
    description "Userの一覧取得"

    def resolve
      'pong'
    end
  end
end

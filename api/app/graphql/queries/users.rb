module Queries
  class Users < Queries::Base
    type [Types::UserType], null: false
    description "Userの一覧取得"

    def resolve
      ::User.all
    end
  end
end

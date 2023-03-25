# frozen_string_literal: true

module Queries
  class CurrentUser < Queries::Base
    type Types::UserType, null: false
    description 'CurrentUser 取得'

    def resolve
      context[:current_user]
    end
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  activated  :boolean          not null
#  email      :string           not null
#  name       :string
#  uid        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    activated { true }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    uid { SecureRandom.uuid }
  end
end

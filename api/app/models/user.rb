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
class User < ApplicationRecord
  validates :email, presence: true
  validates :uid, presence: true

  has_many :answer_histories, dependent: :destroy
end

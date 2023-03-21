# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  activated  :boolean          not null
#  email      :string
#  name       :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
end

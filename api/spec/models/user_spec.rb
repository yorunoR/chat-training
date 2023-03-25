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
require 'rails_helper'

describe User, type: :model do
  describe 'factories' do
    it '有効' do
      expect(build(:user)).to be_valid
    end
  end
end

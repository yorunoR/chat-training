# frozen_string_literal: true

# == Schema Information
#
# Table name: answer_histories
#
#  id         :bigint           not null, primary key
#  answer     :text             not null
#  question   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_answer_histories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

describe AnswerHistory, type: :model do
  describe 'factories' do
    it '有効' do
      expect(build(:user)).to be_valid
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::CurrentUser do
  describe '#resolve' do
    subject { AppSchema.execute(query, variables:, context:).to_h.with_indifferent_access }

    let(:user) { create(:user) }
    let(:context) { { current_user: user } }
    let(:query) do
      <<~QUERY
        query CurrentUser {
          currentUser {
            name
            email
            uid
          }
        }
      QUERY
    end
    let(:variables) { nil }

    it 'ユーザ情報が取得できること' do
      result = subject

      expect(result[:errors]).to eq nil
      current_user = result[:data][:currentUser]
      expect(current_user[:name]).to eq user.name
      expect(current_user[:email]).to eq user.email
      expect(current_user[:uid]).to eq user.uid
    end

    context 'ログインしていない時' do
      let(:context) { { current_user: nil } }

      it 'エラーとなること' do
        result = subject

        expect(result[:data]).to be_nil
        expect(result[:errors]).to be_present
      end
    end
  end
end

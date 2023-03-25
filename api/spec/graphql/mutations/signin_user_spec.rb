# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SendQuestion do
  describe '#resolve' do
    subject { AppSchema.execute(query, variables:, context:).to_h.with_indifferent_access }

    let(:user_attr) { attributes_for(:user) }
    let(:uid) { user_attr[:uid] }
    let(:context) do
      {
        uid:,
        name: user_attr[:name],
        email: user_attr[:email]
      }
    end
    let(:query) do
      <<~QUERY
        mutation signinUser {
          signinUser( input: {} ) {
            user {
              id
              uid
              name
              email
            }
          }
        }
      QUERY
    end
    let(:variables) { nil }

    it 'ユーザが作成されること' do
      expect { subject }.to change { User.count }.by(1)
    end

    it '返されたデータが正しいこと' do
      result = subject

      expect(result[:errors]).to eq nil
      expect(result[:data][:signinUser][:user][:id]).to be_present
      expect(result[:data][:signinUser][:user][:uid]).to eq user_attr[:uid]
      expect(result[:data][:signinUser][:user][:name]).to eq user_attr[:name]
      expect(result[:data][:signinUser][:user][:email]).to eq user_attr[:email]
    end

    context '作成済みの時' do
      let!(:user) { create(:user) }
      let(:uid) { user.uid }

      it 'ユーザーが作成されないこと' do
        expect { subject }.not_to change { User.count }.from(1)
      end

      it '返されたデータが正しいこと' do
        result = subject

        expect(result[:errors]).to be_nil
        expect(result[:data][:signinUser][:user][:id]).to eq user.id.to_s
        expect(result[:data][:signinUser][:user][:uid]).to eq user.uid
        expect(result[:data][:signinUser][:user][:name]).to eq user.name
        expect(result[:data][:signinUser][:user][:email]).to eq user.email
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SendQuestion do
  describe '#resolve' do
    subject { AppSchema.execute(query, variables:, context:).to_h.with_indifferent_access }

    let(:user) { create(:user) }
    let(:context) { { current_user: user } }
    let(:query) do
      <<~QUERY
        mutation SendQuestion($question: String!) {
          sendQuestion( input: { question: $question } ) {
            answer
          }
        }
      QUERY
    end
    let(:variables) do
      { question: 'カレーの作り方は？' }
    end

    let(:client_instance) { double('Openai API client') }

    before do
      allow(OpenaiClient).to receive(:new).and_return(client_instance)
      allow(client_instance).to receive_messages(send_question: '分かりません。')
    end

    it '回答が返ってくること' do
      result = subject

      expect(result[:errors]).to eq nil
      expect(result[:data][:sendQuestion][:answer]).to eq '分かりません。'
    end

    context 'ログインしていない時' do
      let(:context) { { current_user: nil } }

      it 'エラーとなること' do
        result = subject

        expect(result[:data][:sendQuestion]).to be_nil
        expect(result[:errors]).to be_present
      end
    end
  end
end

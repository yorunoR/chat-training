# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SaveAnswer do
  describe '#resolve' do
    subject { AppSchema.execute(query, variables:, context:).to_h.with_indifferent_access }

    let(:user) { create(:user) }
    let(:context) { { current_user: user } }
    let(:query) do
      <<~QUERY
        mutation SaveAnswer($question: String!, $answer: String!) {
          saveAnswer( input: { question: $question, answer: $answer } ) {
            answerHistory {
              id
            }
          }
        }
      QUERY
    end
    let(:variables) do
      { question: 'カレーの作り方は？', answer: '分かりません。' }
    end

    it '履歴が保存されること' do
      result = subject

      expect(AnswerHistory.count).to eq 1
      answer_history = AnswerHistory.first
      expect(answer_history.question).to eq variables[:question]
      expect(answer_history.answer).to eq variables[:answer]
      expect(result[:errors]).to eq nil
      expect(result[:data][:saveAnswer][:answerHistory][:id]).to eq answer_history.id.to_s
    end

    context 'ログインしていない時' do
      let(:context) { { current_user: nil } }

      it 'エラーとなること' do
        result = subject

        expect(result[:data][:saveAnswer]).to be_nil
        expect(result[:errors]).to be_present
      end
    end
  end
end

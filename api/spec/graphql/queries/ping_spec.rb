# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::Ping do
  describe '#resolve' do
    subject { AppSchema.execute(query, variables:, context:).to_h.with_indifferent_access }

    let(:context) { nil }
    let(:query) do
      <<~QUERY
        query Ping {
          ping
        }
      QUERY
    end
    let(:variables) { nil }

    it 'レスポンスがあること' do
      result = subject

      expect(result[:errors]).to eq nil
      expect(result[:data][:ping]).to eq 'pong'
    end
  end
end

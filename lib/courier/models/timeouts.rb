# frozen_string_literal: true

module Courier
  module Models
    class Timeouts < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #
      #   @return [Integer, nil]
      optional :channel, Integer, nil?: true

      # @!attribute provider
      #
      #   @return [Integer, nil]
      optional :provider, Integer, nil?: true

      # @!method initialize(channel: nil, provider: nil)
      #   @param channel [Integer, nil]
      #   @param provider [Integer, nil]
    end
  end
end

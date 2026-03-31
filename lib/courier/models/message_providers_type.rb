# frozen_string_literal: true

module Courier
  module Models
    class MessageProvidersType < Courier::Internal::Type::BaseModel
      # @!attribute if_
      #   JS conditional with access to data/profile.
      #
      #   @return [String, nil]
      optional :if_, String, api_name: :if, nil?: true

      # @!attribute metadata
      #
      #   @return [Courier::Models::Metadata, nil]
      optional :metadata, -> { Courier::Metadata }, nil?: true

      # @!attribute override
      #   Provider-specific overrides.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute timeouts
      #
      #   @return [Integer, nil]
      optional :timeouts, Integer, nil?: true

      # @!method initialize(if_: nil, metadata: nil, override: nil, timeouts: nil)
      #   @param if_ [String, nil] JS conditional with access to data/profile.
      #
      #   @param metadata [Courier::Models::Metadata, nil]
      #
      #   @param override [Hash{Symbol=>Object}, nil] Provider-specific overrides.
      #
      #   @param timeouts [Integer, nil]
    end
  end
end

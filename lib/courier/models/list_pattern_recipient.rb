# frozen_string_literal: true

module Courier
  module Models
    class ListPatternRecipient < Courier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute list_pattern
      #
      #   @return [String, nil]
      optional :list_pattern, String, nil?: true

      # @!method initialize(data: nil, list_pattern: nil)
      #   Send to users in lists matching a pattern
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #   @param list_pattern [String, nil]
    end
  end
end

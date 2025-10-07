# frozen_string_literal: true

module Courier
  module Models
    class ListRecipient < Courier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute list_id
      #
      #   @return [String, nil]
      optional :list_id, String, nil?: true

      # @!method initialize(data: nil, list_id: nil)
      #   @param data [Hash{Symbol=>Object}, nil]
      #   @param list_id [String, nil]
    end
  end
end

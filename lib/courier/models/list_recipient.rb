# frozen_string_literal: true

module Courier
  module Models
    class ListRecipient < Courier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute filters
      #
      #   @return [Array<Courier::Models::ListFilter>, nil]
      optional :filters, -> { Courier::Internal::Type::ArrayOf[Courier::ListFilter] }, nil?: true

      # @!attribute list_id
      #
      #   @return [String, nil]
      optional :list_id, String, nil?: true

      # @!method initialize(data: nil, filters: nil, list_id: nil)
      #   Send to all users in a specific list
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #   @param filters [Array<Courier::Models::ListFilter>, nil]
      #   @param list_id [String, nil]
    end
  end
end

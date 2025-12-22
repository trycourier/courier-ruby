# frozen_string_literal: true

module Trycourier
  module Models
    class ListRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute filters
      #
      #   @return [Array<Trycourier::Models::ListFilter>, nil]
      optional :filters, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::ListFilter] }, nil?: true

      # @!attribute list_id
      #
      #   @return [String, nil]
      optional :list_id, String, nil?: true

      # @!method initialize(data: nil, filters: nil, list_id: nil)
      #   Send to all users in a specific list
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #   @param filters [Array<Trycourier::Models::ListFilter>, nil]
      #   @param list_id [String, nil]
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::RoutingStrategies#create
    class RoutingStrategyMutationResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The routing strategy ID (rs\_ prefix).
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   Response returned by create and replace operations.
      #
      #   @param id [String] The routing strategy ID (rs\_ prefix).
    end
  end
end

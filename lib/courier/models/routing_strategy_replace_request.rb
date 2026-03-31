# frozen_string_literal: true

module Courier
  module Models
    class RoutingStrategyReplaceRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the routing strategy.
      #
      #   @return [String]
      required :name, String

      # @!attribute routing
      #   Routing tree defining channel selection method and order.
      #
      #   @return [Courier::Models::MessageRouting]
      required :routing, -> { Courier::MessageRouting }

      # @!attribute channels
      #   Per-channel delivery configuration. Omit to clear.
      #
      #   @return [Hash{Symbol=>Courier::Models::Channel}, nil]
      optional :channels, -> { Courier::Internal::Type::HashOf[Courier::Channel] }, nil?: true

      # @!attribute description
      #   Optional description. Omit or null to clear.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute providers
      #   Per-provider delivery configuration. Omit to clear.
      #
      #   @return [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil]
      optional :providers, -> { Courier::Internal::Type::HashOf[Courier::MessageProvidersType] }, nil?: true

      # @!attribute tags
      #   Optional tags. Omit or null to clear.
      #
      #   @return [Array<String>, nil]
      optional :tags, Courier::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(name:, routing:, channels: nil, description: nil, providers: nil, tags: nil)
      #   Request body for replacing a routing strategy. Full document replacement;
      #   missing optional fields are cleared.
      #
      #   @param name [String] Human-readable name for the routing strategy.
      #
      #   @param routing [Courier::Models::MessageRouting] Routing tree defining channel selection method and order.
      #
      #   @param channels [Hash{Symbol=>Courier::Models::Channel}, nil] Per-channel delivery configuration. Omit to clear.
      #
      #   @param description [String, nil] Optional description. Omit or null to clear.
      #
      #   @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil] Per-provider delivery configuration. Omit to clear.
      #
      #   @param tags [Array<String>, nil] Optional tags. Omit or null to clear.
    end
  end
end

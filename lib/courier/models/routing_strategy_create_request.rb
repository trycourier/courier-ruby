# frozen_string_literal: true

module Courier
  module Models
    class RoutingStrategyCreateRequest < Courier::Internal::Type::BaseModel
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
      #   Per-channel delivery configuration. Defaults to empty if omitted.
      #
      #   @return [Hash{Symbol=>Courier::Models::Channel}, nil]
      optional :channels, -> { Courier::Internal::Type::HashOf[Courier::Channel] }, nil?: true

      # @!attribute description
      #   Optional description of the routing strategy.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute providers
      #   Per-provider delivery configuration. Defaults to empty if omitted.
      #
      #   @return [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil]
      optional :providers, -> { Courier::Internal::Type::HashOf[Courier::MessageProvidersType] }, nil?: true

      # @!attribute tags
      #   Optional tags for categorization.
      #
      #   @return [Array<String>, nil]
      optional :tags, Courier::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(name:, routing:, channels: nil, description: nil, providers: nil, tags: nil)
      #   Request body for creating a routing strategy.
      #
      #   @param name [String] Human-readable name for the routing strategy.
      #
      #   @param routing [Courier::Models::MessageRouting] Routing tree defining channel selection method and order.
      #
      #   @param channels [Hash{Symbol=>Courier::Models::Channel}, nil] Per-channel delivery configuration. Defaults to empty if omitted.
      #
      #   @param description [String, nil] Optional description of the routing strategy.
      #
      #   @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil] Per-provider delivery configuration. Defaults to empty if omitted.
      #
      #   @param tags [Array<String>, nil] Optional tags for categorization.
    end
  end
end

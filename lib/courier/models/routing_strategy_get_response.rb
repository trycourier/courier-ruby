# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::RoutingStrategies#retrieve
    class RoutingStrategyGetResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The routing strategy ID (rs\_ prefix).
      #
      #   @return [String]
      required :id, String

      # @!attribute channels
      #   Per-channel delivery configuration. May be empty.
      #
      #   @return [Hash{Symbol=>Courier::Models::Channel}]
      required :channels, -> { Courier::Internal::Type::HashOf[Courier::Channel] }

      # @!attribute created
      #   Epoch milliseconds when the strategy was created.
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute creator
      #   User ID of the creator.
      #
      #   @return [String]
      required :creator, String

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!attribute providers
      #   Per-provider delivery configuration. May be empty.
      #
      #   @return [Hash{Symbol=>Courier::Models::MessageProvidersType}]
      required :providers, -> { Courier::Internal::Type::HashOf[Courier::MessageProvidersType] }

      # @!attribute routing
      #   Routing tree defining channel selection method and order.
      #
      #   @return [Courier::Models::MessageRouting]
      required :routing, -> { Courier::MessageRouting }

      # @!attribute description
      #   Description of the routing strategy.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute tags
      #   Tags for categorization.
      #
      #   @return [Array<String>, nil]
      optional :tags, Courier::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute updated
      #   Epoch milliseconds of last update.
      #
      #   @return [Integer, nil]
      optional :updated, Integer, nil?: true

      # @!attribute updater
      #   User ID of the last updater.
      #
      #   @return [String, nil]
      optional :updater, String, nil?: true

      # @!method initialize(id:, channels:, created:, creator:, name:, providers:, routing:, description: nil, tags: nil, updated: nil, updater: nil)
      #   Full routing strategy entity returned by GET.
      #
      #   @param id [String] The routing strategy ID (rs\_ prefix).
      #
      #   @param channels [Hash{Symbol=>Courier::Models::Channel}] Per-channel delivery configuration. May be empty.
      #
      #   @param created [Integer] Epoch milliseconds when the strategy was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param name [String] Human-readable name.
      #
      #   @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}] Per-provider delivery configuration. May be empty.
      #
      #   @param routing [Courier::Models::MessageRouting] Routing tree defining channel selection method and order.
      #
      #   @param description [String, nil] Description of the routing strategy.
      #
      #   @param tags [Array<String>, nil] Tags for categorization.
      #
      #   @param updated [Integer, nil] Epoch milliseconds of last update.
      #
      #   @param updater [String, nil] User ID of the last updater.
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    class RoutingStrategySummary < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The routing strategy ID (rs\_ prefix).
      #
      #   @return [String]
      required :id, String

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

      # @!method initialize(id:, created:, creator:, name:, description: nil, tags: nil, updated: nil, updater: nil)
      #   Routing strategy metadata returned in list responses. Does not include
      #   routing/channels/providers content.
      #
      #   @param id [String] The routing strategy ID (rs\_ prefix).
      #
      #   @param created [Integer] Epoch milliseconds when the strategy was created.
      #
      #   @param creator [String] User ID of the creator.
      #
      #   @param name [String] Human-readable name.
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

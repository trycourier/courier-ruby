# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::WorkspacePreferences#create
    class WorkspacePreferenceGetResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The workspace preference id.
      #
      #   @return [String]
      required :id, String

      # @!attribute created
      #   ISO-8601 timestamp of when the workspace preference was created.
      #
      #   @return [String]
      required :created, String

      # @!attribute has_custom_routing
      #   Whether the workspace preference defines custom routing for its topics.
      #
      #   @return [Boolean]
      required :has_custom_routing, Courier::Internal::Type::Boolean

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!attribute routing_options
      #   Default channels for the workspace preference. May be empty.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>]
      required :routing_options, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

      # @!attribute topics
      #   The topics contained in this workspace preference.
      #
      #   @return [Array<Courier::Models::WorkspacePreferenceTopicGetResponse>]
      required :topics, -> { Courier::Internal::Type::ArrayOf[Courier::WorkspacePreferenceTopicGetResponse] }

      # @!attribute creator
      #   Id of the creator.
      #
      #   @return [String, nil]
      optional :creator, String, nil?: true

      # @!attribute updated
      #   ISO-8601 timestamp of the last update.
      #
      #   @return [String, nil]
      optional :updated, String, nil?: true

      # @!attribute updater
      #   Id of the last updater.
      #
      #   @return [String, nil]
      optional :updater, String, nil?: true

      # @!method initialize(id:, created:, has_custom_routing:, name:, routing_options:, topics:, creator: nil, updated: nil, updater: nil)
      #   A workspace preference in your workspace, including its topics.
      #
      #   @param id [String] The workspace preference id.
      #
      #   @param created [String] ISO-8601 timestamp of when the workspace preference was created.
      #
      #   @param has_custom_routing [Boolean] Whether the workspace preference defines custom routing for its topics.
      #
      #   @param name [String] Human-readable name.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>] Default channels for the workspace preference. May be empty.
      #
      #   @param topics [Array<Courier::Models::WorkspacePreferenceTopicGetResponse>] The topics contained in this workspace preference.
      #
      #   @param creator [String, nil] Id of the creator.
      #
      #   @param updated [String, nil] ISO-8601 timestamp of the last update.
      #
      #   @param updater [String, nil] Id of the last updater.
    end
  end
end

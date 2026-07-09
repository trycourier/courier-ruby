# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceTopicGetResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The preference topic id.
      #
      #   @return [String]
      required :id, String

      # @!attribute allowed_preferences
      #   Preference controls a recipient may customize. May be empty.
      #
      #   @return [Array<Symbol, Courier::Models::WorkspacePreferenceTopicGetResponse::AllowedPreference>]
      required :allowed_preferences,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::WorkspacePreferenceTopicGetResponse::AllowedPreference] }

      # @!attribute created
      #   ISO-8601 timestamp of when the topic was created.
      #
      #   @return [String]
      required :created, String

      # @!attribute default_status
      #   The default subscription status applied when a recipient has not set their own.
      #
      #   @return [Symbol, Courier::Models::WorkspacePreferenceTopicGetResponse::DefaultStatus]
      required :default_status, enum: -> { Courier::WorkspacePreferenceTopicGetResponse::DefaultStatus }

      # @!attribute include_unsubscribe_header
      #   Whether a list-unsubscribe header is included on emails for this topic.
      #
      #   @return [Boolean]
      required :include_unsubscribe_header, Courier::Internal::Type::Boolean

      # @!attribute name
      #   Human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!attribute routing_options
      #   Default channels delivered for this topic. May be empty.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>]
      required :routing_options, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

      # @!attribute topic_data
      #   Arbitrary metadata associated with the topic.
      #
      #   @return [Hash{Symbol=>Object}]
      required :topic_data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute updated
      #   ISO-8601 timestamp of the last update.
      #
      #   @return [String]
      required :updated, String

      # @!attribute creator
      #   Id of the creator.
      #
      #   @return [String, nil]
      optional :creator, String, nil?: true

      # @!attribute description
      #   Optional description shown under the topic on the hosted preferences page.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute updater
      #   Id of the last updater.
      #
      #   @return [String, nil]
      optional :updater, String, nil?: true

      # @!method initialize(id:, allowed_preferences:, created:, default_status:, include_unsubscribe_header:, name:, routing_options:, topic_data:, updated:, creator: nil, description: nil, updater: nil)
      #   A subscription preference topic in your workspace.
      #
      #   @param id [String] The preference topic id.
      #
      #   @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicGetResponse::AllowedPreference>] Preference controls a recipient may customize. May be empty.
      #
      #   @param created [String] ISO-8601 timestamp of when the topic was created.
      #
      #   @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicGetResponse::DefaultStatus] The default subscription status applied when a recipient has not set their own.
      #
      #   @param include_unsubscribe_header [Boolean] Whether a list-unsubscribe header is included on emails for this topic.
      #
      #   @param name [String] Human-readable name.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>] Default channels delivered for this topic. May be empty.
      #
      #   @param topic_data [Hash{Symbol=>Object}] Arbitrary metadata associated with the topic.
      #
      #   @param updated [String] ISO-8601 timestamp of the last update.
      #
      #   @param creator [String, nil] Id of the creator.
      #
      #   @param description [String, nil] Optional description shown under the topic on the hosted preferences page.
      #
      #   @param updater [String, nil] Id of the last updater.

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        SNOOZE = :snooze
        CHANNEL_PREFERENCES = :channel_preferences

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The default subscription status applied when a recipient has not set their own.
      #
      # @see Courier::Models::WorkspacePreferenceTopicGetResponse#default_status
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        OPTED_OUT = :OPTED_OUT
        OPTED_IN = :OPTED_IN
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

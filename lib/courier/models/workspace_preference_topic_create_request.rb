# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceTopicCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute default_status
      #   The default subscription status applied when a recipient has not set their own.
      #
      #   @return [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus]
      required :default_status, enum: -> { Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus }

      # @!attribute name
      #   Human-readable name for the preference topic.
      #
      #   @return [String]
      required :name, String

      # @!attribute allowed_preferences
      #   Preference controls a recipient may customize for this topic. Defaults to empty
      #   if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil]
      optional :allowed_preferences,
               -> {
                 Courier::Internal::Type::ArrayOf[enum: Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference]
               },
               nil?: true

      # @!attribute description
      #   Optional description shown under the topic on the hosted preferences page.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute include_unsubscribe_header
      #   Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @return [Boolean, nil]
      optional :include_unsubscribe_header, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels delivered for this topic. Defaults to empty if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!attribute topic_data
      #   Arbitrary metadata associated with the topic.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :topic_data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(default_status:, name:, allowed_preferences: nil, description: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::WorkspacePreferenceTopicCreateRequest} for more details.
      #
      #   Request body for creating a preference topic.
      #
      #   @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus] The default subscription status applied when a recipient has not set their own.
      #
      #   @param name [String] Human-readable name for the preference topic.
      #
      #   @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil] Preference controls a recipient may customize for this topic. Defaults to empty
      #
      #   @param description [String, nil] Optional description shown under the topic on the hosted preferences page.
      #
      #   @param include_unsubscribe_header [Boolean, nil] Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels delivered for this topic. Defaults to empty if omitted.
      #
      #   @param topic_data [Hash{Symbol=>Object}, nil] Arbitrary metadata associated with the topic.

      # The default subscription status applied when a recipient has not set their own.
      #
      # @see Courier::Models::WorkspacePreferenceTopicCreateRequest#default_status
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        OPTED_OUT = :OPTED_OUT
        OPTED_IN = :OPTED_IN
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        SNOOZE = :snooze
        CHANNEL_PREFERENCES = :channel_preferences

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

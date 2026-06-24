# frozen_string_literal: true

module Courier
  module Models
    class PreferenceTopicReplaceRequest < Courier::Internal::Type::BaseModel
      # @!attribute default_status
      #   The default subscription status applied when a recipient has not set their own.
      #
      #   @return [Symbol, Courier::Models::PreferenceTopicReplaceRequest::DefaultStatus]
      required :default_status, enum: -> { Courier::PreferenceTopicReplaceRequest::DefaultStatus }

      # @!attribute name
      #   Human-readable name for the preference topic.
      #
      #   @return [String]
      required :name, String

      # @!attribute allowed_preferences
      #   Preference controls a recipient may customize. Omit to clear.
      #
      #   @return [Array<Symbol, Courier::Models::PreferenceTopicReplaceRequest::AllowedPreference>, nil]
      optional :allowed_preferences,
               -> {
                 Courier::Internal::Type::ArrayOf[enum: Courier::PreferenceTopicReplaceRequest::AllowedPreference]
               },
               nil?: true

      # @!attribute include_unsubscribe_header
      #   Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @return [Boolean, nil]
      optional :include_unsubscribe_header, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels delivered for this topic. Omit to clear.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!attribute topic_data
      #   Arbitrary metadata associated with the topic. Omit to clear.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :topic_data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(default_status:, name:, allowed_preferences: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil)
      #   Request body for replacing a preference topic. Full document replacement;
      #   missing optional fields are cleared.
      #
      #   @param default_status [Symbol, Courier::Models::PreferenceTopicReplaceRequest::DefaultStatus] The default subscription status applied when a recipient has not set their own.
      #
      #   @param name [String] Human-readable name for the preference topic.
      #
      #   @param allowed_preferences [Array<Symbol, Courier::Models::PreferenceTopicReplaceRequest::AllowedPreference>, nil] Preference controls a recipient may customize. Omit to clear.
      #
      #   @param include_unsubscribe_header [Boolean, nil] Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels delivered for this topic. Omit to clear.
      #
      #   @param topic_data [Hash{Symbol=>Object}, nil] Arbitrary metadata associated with the topic. Omit to clear.

      # The default subscription status applied when a recipient has not set their own.
      #
      # @see Courier::Models::PreferenceTopicReplaceRequest#default_status
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

# frozen_string_literal: true

module Courier
  module Models
    module Users
      class TopicPreference < Courier::Internal::Type::BaseModel
        # @!attribute default_status
        #   The topic's default status, returned on reads. It applies whenever the user has
        #   no override of their own (status equals this value).
        #
        #   @return [Symbol, Courier::Models::PreferenceStatus]
        required :default_status, enum: -> { Courier::PreferenceStatus }

        # @!attribute status
        #   The user's subscription status for this topic. OPTED_IN or OPTED_OUT reflect the
        #   user's own choice; REQUIRED is a topic-level default set in the preferences
        #   editor, not a user choice.
        #
        #   @return [Symbol, Courier::Models::PreferenceStatus]
        required :status, enum: -> { Courier::PreferenceStatus }

        # @!attribute topic_id
        #   The unique identifier of the subscription topic this preference applies to.
        #
        #   @return [String]
        required :topic_id, String

        # @!attribute topic_name
        #   The display name of the subscription topic, returned on reads.
        #
        #   @return [String]
        required :topic_name, String

        # @!attribute custom_routing
        #   The channels the user has chosen to receive this topic on, present only when
        #   has_custom_routing is true. One or more of: direct_message, email, push, sms,
        #   webhook, inbox.
        #
        #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
        optional :custom_routing,
                 -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
                 nil?: true

        # @!attribute digest_schedule_id
        #   The digest schedule this recipient is on for the topic. Omitted rather than null
        #   when they have not chosen one, in which case the topic's default schedule
        #   applies. Ids come from the topic's digest configuration, returned on any read of
        #   the topic.
        #
        #   Also omitted when the schedule they chose has since been deleted or disabled:
        #   the recipient is on the topic's default from that point on, which is how a send
        #   already resolves it, so the field reports what would actually be used rather
        #   than a dead id.
        #
        #   @return [String, nil]
        optional :digest_schedule_id, String

        # @!attribute has_custom_routing
        #   Whether the user has chosen specific delivery channels for this topic (listed in
        #   custom_routing) rather than the topic's default routing.
        #
        #   @return [Boolean, nil]
        optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

        # @!attribute section_id
        #   The unique identifier of the section this topic belongs to. Always present when
        #   listing a user's preferences; omitted by the single-topic read when the topic
        #   has no resolvable section.
        #
        #   @return [String, nil]
        optional :section_id, String

        # @!attribute section_name
        #   The display name of the section this topic belongs to. Always present when
        #   listing a user's preferences; omitted by the single-topic read when the topic
        #   has no resolvable section.
        #
        #   @return [String, nil]
        optional :section_name, String

        # @!method initialize(default_status:, status:, topic_id:, topic_name:, custom_routing: nil, digest_schedule_id: nil, has_custom_routing: nil, section_id: nil, section_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Users::TopicPreference} for more details.
        #
        #   @param default_status [Symbol, Courier::Models::PreferenceStatus] The topic's default status, returned on reads. It applies whenever the user has
        #
        #   @param status [Symbol, Courier::Models::PreferenceStatus] The user's subscription status for this topic. OPTED_IN or OPTED_OUT reflect the
        #
        #   @param topic_id [String] The unique identifier of the subscription topic this preference applies to.
        #
        #   @param topic_name [String] The display name of the subscription topic, returned on reads.
        #
        #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>, nil] The channels the user has chosen to receive this topic on, present only when has
        #
        #   @param digest_schedule_id [String] The digest schedule this recipient is on for the topic. Omitted rather than null
        #
        #   @param has_custom_routing [Boolean, nil] Whether the user has chosen specific delivery channels for this topic (listed in
        #
        #   @param section_id [String] The unique identifier of the section this topic belongs to. Always present when
        #
        #   @param section_name [String] The display name of the section this topic belongs to. Always present when listi
      end
    end
  end
end

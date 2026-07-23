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

        # @!attribute has_custom_routing
        #   Whether the user has chosen specific delivery channels for this topic (listed in
        #   custom_routing) rather than the topic's default routing.
        #
        #   @return [Boolean, nil]
        optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

        # @!method initialize(default_status:, status:, topic_id:, topic_name:, custom_routing: nil, has_custom_routing: nil)
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
        #   @param has_custom_routing [Boolean, nil] Whether the user has chosen specific delivery channels for this topic (listed in
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Preferences#update_or_create_topic
      class PreferenceUpdateOrCreateTopicParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!attribute topic
        #
        #   @return [Courier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic]
        required :topic, -> { Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic }

        # @!attribute tenant_id
        #   Update the preferences of a user for this specific tenant context.
        #
        #   @return [String, nil]
        optional :tenant_id, String, nil?: true

        # @!method initialize(user_id:, topic_id:, topic:, tenant_id: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param topic_id [String]
        #
        #   @param topic [Courier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic]
        #
        #   @param tenant_id [String, nil] Update the preferences of a user for this specific tenant context.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        class Topic < Courier::Internal::Type::BaseModel
          # @!attribute status
          #   The subscription status to set: OPTED_IN or OPTED_OUT. REQUIRED is a topic-level
          #   default, not a user choice; the API rejects opting a user out of a REQUIRED
          #   topic.
          #
          #   @return [Symbol, Courier::Models::PreferenceStatus]
          required :status, enum: -> { Courier::PreferenceStatus }

          # @!attribute custom_routing
          #   The channels to deliver this topic on when has_custom_routing is true. One or
          #   more of: direct_message, email, push, sms, webhook, inbox.
          #
          #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
          optional :custom_routing,
                   -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
                   nil?: true

          # @!attribute has_custom_routing
          #   Set to true to route this topic to the channels in custom_routing instead of the
          #   topic's default routing.
          #
          #   @return [Boolean, nil]
          optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

          # @!method initialize(status:, custom_routing: nil, has_custom_routing: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic} for more
          #   details.
          #
          #   @param status [Symbol, Courier::Models::PreferenceStatus] The subscription status to set: OPTED_IN or OPTED_OUT. REQUIRED is a topic-level
          #
          #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>, nil] The channels to deliver this topic on when has_custom_routing is true. One or mo
          #
          #   @param has_custom_routing [Boolean, nil] Set to true to route this topic to the channels in custom_routing instead of the
        end
      end
    end
  end
end

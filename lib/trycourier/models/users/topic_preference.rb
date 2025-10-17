# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      class TopicPreference < Trycourier::Internal::Type::BaseModel
        # @!attribute default_status
        #
        #   @return [Symbol, Trycourier::Models::PreferenceStatus]
        required :default_status, enum: -> { Trycourier::PreferenceStatus }

        # @!attribute status
        #
        #   @return [Symbol, Trycourier::Models::PreferenceStatus]
        required :status, enum: -> { Trycourier::PreferenceStatus }

        # @!attribute topic_id
        #
        #   @return [String]
        required :topic_id, String

        # @!attribute topic_name
        #
        #   @return [String]
        required :topic_name, String

        # @!attribute custom_routing
        #   The Channels a user has chosen to receive notifications through for this topic
        #
        #   @return [Array<Symbol, Trycourier::Models::ChannelClassification>, nil]
        optional :custom_routing,
                 -> { Trycourier::Internal::Type::ArrayOf[enum: Trycourier::ChannelClassification] },
                 nil?: true

        # @!attribute has_custom_routing
        #
        #   @return [Boolean, nil]
        optional :has_custom_routing, Trycourier::Internal::Type::Boolean, nil?: true

        # @!method initialize(default_status:, status:, topic_id:, topic_name:, custom_routing: nil, has_custom_routing: nil)
        #   @param default_status [Symbol, Trycourier::Models::PreferenceStatus]
        #
        #   @param status [Symbol, Trycourier::Models::PreferenceStatus]
        #
        #   @param topic_id [String]
        #
        #   @param topic_name [String]
        #
        #   @param custom_routing [Array<Symbol, Trycourier::Models::ChannelClassification>, nil] The Channels a user has chosen to receive notifications through for this topic
        #
        #   @param has_custom_routing [Boolean, nil]
      end
    end
  end
end

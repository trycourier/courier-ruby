# frozen_string_literal: true

module Courier
  module Models
    module Users
      class TopicPreference < Courier::Internal::Type::BaseModel
        # @!attribute default_status
        #
        #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
        required :default_status, enum: -> { Courier::Users::PreferenceStatus }

        # @!attribute status
        #
        #   @return [Symbol, Courier::Models::Users::PreferenceStatus]
        required :status, enum: -> { Courier::Users::PreferenceStatus }

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
        #   @return [Array<Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification>, nil]
        optional :custom_routing,
                 -> {
                   Courier::Internal::Type::ArrayOf[enum: Courier::Tenants::DefaultPreferences::ChannelClassification]
                 },
                 nil?: true

        # @!attribute has_custom_routing
        #
        #   @return [Boolean, nil]
        optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

        # @!method initialize(default_status:, status:, topic_id:, topic_name:, custom_routing: nil, has_custom_routing: nil)
        #   @param default_status [Symbol, Courier::Models::Users::PreferenceStatus]
        #
        #   @param status [Symbol, Courier::Models::Users::PreferenceStatus]
        #
        #   @param topic_id [String]
        #
        #   @param topic_name [String]
        #
        #   @param custom_routing [Array<Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification>, nil] The Channels a user has chosen to receive notifications through for this topic
        #
        #   @param has_custom_routing [Boolean, nil]
      end
    end
  end
end

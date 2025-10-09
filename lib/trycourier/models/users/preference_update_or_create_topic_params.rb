# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      # @see Trycourier::Resources::Users::Preferences#update_or_create_topic
      class PreferenceUpdateOrCreateTopicParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute topic
        #
        #   @return [Trycourier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic]
        required :topic, -> { Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic }

        # @!attribute tenant_id
        #   Update the preferences of a user for this specific tenant context.
        #
        #   @return [String, nil]
        optional :tenant_id, String, nil?: true

        # @!method initialize(user_id:, topic:, tenant_id: nil, request_options: {})
        #   @param user_id [String]
        #
        #   @param topic [Trycourier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic]
        #
        #   @param tenant_id [String, nil] Update the preferences of a user for this specific tenant context.
        #
        #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

        class Topic < Trycourier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Trycourier::Models::PreferenceStatus]
          required :status, enum: -> { Trycourier::PreferenceStatus }

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

          # @!method initialize(status:, custom_routing: nil, has_custom_routing: nil)
          #   @param status [Symbol, Trycourier::Models::PreferenceStatus]
          #
          #   @param custom_routing [Array<Symbol, Trycourier::Models::ChannelClassification>, nil] The Channels a user has chosen to receive notifications through for this topic
          #
          #   @param has_custom_routing [Boolean, nil]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      module DefaultPreferences
        class SubscriptionTopicNew < Courier::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, Courier::Models::Tenants::DefaultPreferences::SubscriptionTopicNew::Status]
          required :status, enum: -> { Courier::Tenants::DefaultPreferences::SubscriptionTopicNew::Status }

          # @!attribute custom_routing
          #   The default channels to send to this tenant when has_custom_routing is enabled
          #
          #   @return [Array<Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification>, nil]
          optional :custom_routing,
                   -> {
                     Courier::Internal::Type::ArrayOf[enum: Courier::Tenants::DefaultPreferences::ChannelClassification]
                   },
                   nil?: true

          # @!attribute has_custom_routing
          #   Override channel routing with custom preferences. This will override any
          #   template prefernces that are set, but a user can still customize their
          #   preferences
          #
          #   @return [Boolean, nil]
          optional :has_custom_routing, Courier::Internal::Type::Boolean, nil?: true

          # @!method initialize(status:, custom_routing: nil, has_custom_routing: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Tenants::DefaultPreferences::SubscriptionTopicNew} for more
          #   details.
          #
          #   @param status [Symbol, Courier::Models::Tenants::DefaultPreferences::SubscriptionTopicNew::Status]
          #
          #   @param custom_routing [Array<Symbol, Courier::Models::Tenants::DefaultPreferences::ChannelClassification>, nil] The default channels to send to this tenant when has_custom_routing is enabled
          #
          #   @param has_custom_routing [Boolean, nil] Override channel routing with custom preferences. This will override any templat

          # @see Courier::Models::Tenants::DefaultPreferences::SubscriptionTopicNew#status
          module Status
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
  end
end

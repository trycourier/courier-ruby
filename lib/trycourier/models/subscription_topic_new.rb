# frozen_string_literal: true

module Trycourier
  module Models
    class SubscriptionTopicNew < Trycourier::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, Trycourier::Models::SubscriptionTopicNew::Status]
      required :status, enum: -> { Trycourier::SubscriptionTopicNew::Status }

      # @!attribute custom_routing
      #   The default channels to send to this tenant when has_custom_routing is enabled
      #
      #   @return [Array<Symbol, Trycourier::Models::ChannelClassification>, nil]
      optional :custom_routing,
               -> { Trycourier::Internal::Type::ArrayOf[enum: Trycourier::ChannelClassification] },
               nil?: true

      # @!attribute has_custom_routing
      #   Override channel routing with custom preferences. This will override any
      #   template prefernces that are set, but a user can still customize their
      #   preferences
      #
      #   @return [Boolean, nil]
      optional :has_custom_routing, Trycourier::Internal::Type::Boolean, nil?: true

      # @!method initialize(status:, custom_routing: nil, has_custom_routing: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::SubscriptionTopicNew} for more details.
      #
      #   @param status [Symbol, Trycourier::Models::SubscriptionTopicNew::Status]
      #
      #   @param custom_routing [Array<Symbol, Trycourier::Models::ChannelClassification>, nil] The default channels to send to this tenant when has_custom_routing is enabled
      #
      #   @param has_custom_routing [Boolean, nil] Override channel routing with custom preferences. This will override any templat

      # @see Trycourier::Models::SubscriptionTopicNew#status
      module Status
        extend Trycourier::Internal::Type::Enum

        OPTED_OUT = :OPTED_OUT
        OPTED_IN = :OPTED_IN
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    class PreferenceChangeLogValue < Courier::Internal::Type::BaseModel
      # @!attribute custom_routing
      #   The channels chosen before the change.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>]
      required :custom_routing, -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] }

      # @!attribute has_custom_routing
      #   Whether custom routing was in effect before the change.
      #
      #   @return [Boolean]
      required :has_custom_routing, Courier::Internal::Type::Boolean

      # @!attribute status
      #   The subscription status before the change.
      #
      #   @return [Symbol, Courier::Models::PreferenceStatus]
      required :status, enum: -> { Courier::PreferenceStatus }

      # @!method initialize(custom_routing:, has_custom_routing:, status:)
      #   @param custom_routing [Array<Symbol, Courier::Models::ChannelClassification>] The channels chosen before the change.
      #
      #   @param has_custom_routing [Boolean] Whether custom routing was in effect before the change.
      #
      #   @param status [Symbol, Courier::Models::PreferenceStatus] The subscription status before the change.
    end
  end
end

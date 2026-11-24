# frozen_string_literal: true

module Courier
  module Models
    class NotificationTemplateContent < Courier::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
      required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

      # @!attribute version
      #   For example, "2022-01-01"
      #
      #   @return [String]
      required :version, String

      # @!method initialize(elements:, version:)
      #   Elemental content of a notification template. Template variables read the data
      #   sent with the message through the `data.` prefix, as in `{{data.name}}`, and the
      #   recipient's profile through `profile.`.
      #
      #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
      #
      #   @param version [String] For example, "2022-01-01"
    end
  end
end

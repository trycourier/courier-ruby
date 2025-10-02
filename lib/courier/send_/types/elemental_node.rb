# frozen_string_literal: true

module Courier
  module Send
    module Types
      class ElementalNode < Internal::Types::Model
        extend Courier::Internal::Types::Union

        discriminant :type

        member -> { Courier::Send::Types::ElementalTextNode }, key: "TEXT"
        member -> { Courier::Send::Types::ElementalMetaNode }, key: "META"
        member -> { Courier::Send::Types::ElementalChannelNode }, key: "CHANNEL"
        member -> { Courier::Send::Types::ElementalImageNode }, key: "IMAGE"
        member -> { Courier::Send::Types::ElementalActionNode }, key: "ACTION"
        member -> { Courier::Send::Types::ElementalDividerNode }, key: "DIVIDER"
        member -> { Courier::Send::Types::ElementalGroupNode }, key: "GROUP"
        member -> { Courier::Send::Types::ElementalQuoteNode }, key: "QUOTE"
      end
    end
  end
end

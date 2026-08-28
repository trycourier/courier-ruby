# typed: strong

module Courier
  module Models
    # Represents a body of text to be rendered inside of the notification.
    module ElementalNode
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::ElementalTextNodeWithType,
            Courier::ElementalMetaNodeWithType,
            Courier::ElementalChannelNodeWithType,
            Courier::ElementalImageNodeWithType,
            Courier::ElementalActionNodeWithType,
            Courier::ElementalDividerNodeWithType,
            Courier::ElementalQuoteNodeWithType,
            Courier::ElementalHTMLNodeWithType
          )
        end

      sig { override.returns(T::Array[Courier::ElementalNode::Variants]) }
      def self.variants
      end
    end
  end
end

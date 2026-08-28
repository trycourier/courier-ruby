# typed: strong

module Courier
  module Models
    class ElementalDividerNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalDividerNode, Courier::Internal::AnyHash)
        end

      # The CSS color to render the line with. For example, `#fff`
      sig { returns(T.nilable(String)) }
      attr_accessor :color

      # Renders a dividing line between elements.
      sig { params(color: T.nilable(String)).returns(T.attached_class) }
      def self.new(
        # The CSS color to render the line with. For example, `#fff`
        color: nil
      )
      end

      sig { override.returns({ color: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end

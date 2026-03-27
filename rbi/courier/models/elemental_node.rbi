# typed: strong

module Courier
  module Models
    # The channel element allows a notification to be customized based on which
    # channel it is sent through. For example, you may want to display a detailed
    # message when the notification is sent through email, and a more concise message
    # in a push notification. Channel elements are only valid as top-level elements;
    # you cannot nest channel elements. If there is a channel element specified at the
    # top-level of the document, all sibling elements must be channel elements. Note:
    # As an alternative, most elements support a `channel` property. Which allows you
    # to selectively display an individual element on a per channel basis. See the
    # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
    # for more details.
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
            Courier::ElementalNode::UnionMember7
          )
        end

      class UnionMember7 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember7,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember7::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember7::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember7::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember7::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember7::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTML =
            T.let(
              :html,
              Courier::ElementalNode::UnionMember7::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember7::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[Courier::ElementalNode::Variants]) }
      def self.variants
      end
    end
  end
end

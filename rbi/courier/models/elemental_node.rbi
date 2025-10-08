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
            Courier::ElementalNode::UnionMember0,
            Courier::ElementalNode::UnionMember1,
            Courier::ElementalNode::UnionMember2,
            Courier::ElementalNode::UnionMember3,
            Courier::ElementalNode::UnionMember4,
            Courier::ElementalNode::UnionMember5,
            Courier::ElementalNode::UnionMember6
          )
        end

      class UnionMember0 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember0,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember0::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember0::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember0::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember0::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember0::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              Courier::ElementalNode::UnionMember0::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember0::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember1 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember1,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember1::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember1::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember1::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember1::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember1::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          META =
            T.let(
              :meta,
              Courier::ElementalNode::UnionMember1::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember1::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember2 < Courier::Models::ElementalChannelNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember2,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember2::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember2::Type::OrSymbol
          ).void
        end
        attr_writer :type

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
        sig do
          params(
            type: Courier::ElementalNode::UnionMember2::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember2::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember2::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHANNEL =
            T.let(
              :channel,
              Courier::ElementalNode::UnionMember2::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember2::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember3 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember3,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember3::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember3::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember3::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember3::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember3::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(
              :image,
              Courier::ElementalNode::UnionMember3::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember3::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember4 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember4,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember4::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember4::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember4::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION =
            T.let(
              :action,
              Courier::ElementalNode::UnionMember4::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember4::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember5 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember5,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember5::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember5::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember5::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember5::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember5::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIVIDER =
            T.let(
              :divider,
              Courier::ElementalNode::UnionMember5::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember5::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember6 < Courier::Models::ElementalBaseNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember6,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember6::Type::OrSymbol)
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember6::Type::OrSymbol
          ).void
        end
        attr_writer :type

        sig do
          params(
            type: Courier::ElementalNode::UnionMember6::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::UnionMember6::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember6::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUOTE =
            T.let(
              :quote,
              Courier::ElementalNode::UnionMember6::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::UnionMember6::Type::TaggedSymbol]
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

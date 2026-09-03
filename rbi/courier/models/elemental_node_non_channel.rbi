# typed: strong

module Courier
  module Models
    # Any Elemental node except a channel block. Channel elements are only valid as
    # top-level elements, so the `elements` nested inside one can never be another
    # channel. Keeping this union channel-free also keeps the schema acyclic; a
    # recursive `$ref` here breaks the generated Python models.
    module ElementalNodeNonChannel
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::ElementalNodeNonChannel::UnionMember0,
            Courier::ElementalNodeNonChannel::UnionMember1,
            Courier::ElementalNodeNonChannel::UnionMember2,
            Courier::ElementalNodeNonChannel::UnionMember3,
            Courier::ElementalNodeNonChannel::UnionMember4,
            Courier::ElementalNodeNonChannel::UnionMember5,
            Courier::ElementalNodeNonChannel::UnionMember6
          )
        end

      class UnionMember0 < Courier::Models::ElementalTextNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember0,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember0::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember0::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Represents a body of text to be rendered inside of the notification.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember0::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember0::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember0::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(
              :text,
              Courier::ElementalNodeNonChannel::UnionMember0::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember0::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember1 < Courier::Models::ElementalMetaNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember1,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember1::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember1::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # The meta element contains information describing the notification that may be
        # used by a particular channel or provider. One important field is the title field
        # which will be used as the title for channels that support it.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember1::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember1::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember1::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          META =
            T.let(
              :meta,
              Courier::ElementalNodeNonChannel::UnionMember1::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember1::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember2 < Courier::Models::ElementalImageNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember2,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember2::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember2::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Used to embed an image into the notification.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember2::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember2::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember2::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE =
            T.let(
              :image,
              Courier::ElementalNodeNonChannel::UnionMember2::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember2::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember3 < Courier::Models::ElementalActionNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember3,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember3::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember3::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Allows the user to execute an action. Can be a button or a link.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember3::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember3::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember3::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTION =
            T.let(
              :action,
              Courier::ElementalNodeNonChannel::UnionMember3::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember3::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember4 < Courier::Models::ElementalDividerNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember4,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember4::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember4::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Renders a dividing line between elements.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember4::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember4::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember4::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIVIDER =
            T.let(
              :divider,
              Courier::ElementalNodeNonChannel::UnionMember4::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember4::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember5 < Courier::Models::ElementalQuoteNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember5,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember5::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember5::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Renders a quote block.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember5::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember5::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember5::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUOTE =
            T.let(
              :quote,
              Courier::ElementalNodeNonChannel::UnionMember5::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember5::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember6 < Courier::Models::ElementalHTMLNode
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNodeNonChannel::UnionMember6,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              Courier::ElementalNodeNonChannel::UnionMember6::Type::OrSymbol
            )
          )
        end
        attr_reader :type

        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember6::Type::OrSymbol
          ).void
        end
        attr_writer :type

        # Raw HTML string inside an Elemental document. When rendering a message, this
        # node is turned into output only for the email channel; for other channels it
        # produces no blocks.
        sig do
          params(
            type: Courier::ElementalNodeNonChannel::UnionMember6::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type: nil)
        end

        sig do
          override.returns(
            {
              type:
                Courier::ElementalNodeNonChannel::UnionMember6::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::ElementalNodeNonChannel::UnionMember6::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HTML =
            T.let(
              :html,
              Courier::ElementalNodeNonChannel::UnionMember6::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNodeNonChannel::UnionMember6::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(T::Array[Courier::ElementalNodeNonChannel::Variants])
      end
      def self.variants
      end
    end
  end
end

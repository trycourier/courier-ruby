# typed: strong

module Courier
  module Models
    # Allows you to group elements together. This can be useful when used in
    # combination with "if" or "loop". See
    # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
    # for more details.
    module ElementalNode
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::ElementalNode::UnionMember0,
            Courier::ElementalNode::UnionMember1,
            Courier::ElementalNode::Type,
            Courier::ElementalNode::UnionMember3,
            Courier::ElementalNode::UnionMember4,
            Courier::ElementalNode::UnionMember5,
            Courier::ElementalNode::UnionMember6,
            Courier::ElementalNode::UnionMember7
          )
        end

      class UnionMember0 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember0,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember0::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember0::Type::OrSymbol
            }
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

      class UnionMember1 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember1,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember1::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember1::Type::OrSymbol
            }
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

      class Type < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::ElementalNode::Type, Courier::Internal::AnyHash)
          end

        sig { returns(Courier::ElementalNode::Type::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(type: Courier::ElementalNode::Type::Type::OrSymbol).returns(
            T.attached_class
          )
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            { type: Courier::ElementalNode::Type::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Courier::ElementalNode::Type::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHANNEL =
            T.let(:channel, Courier::ElementalNode::Type::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Courier::ElementalNode::Type::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class UnionMember3 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember3,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember3::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember3::Type::OrSymbol
            }
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

      class UnionMember4 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember4,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
            }
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

      class UnionMember5 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember5,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember5::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember5::Type::OrSymbol
            }
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

      class UnionMember6 < Courier::Models::ElementalGroupNode
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

        # Allows you to group elements together. This can be useful when used in
        # combination with "if" or "loop". See
        # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
        # for more details.
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

          GROUP =
            T.let(
              :group,
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

      class UnionMember7 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember7,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :channels

        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(String)) }
        attr_accessor :loop_

        sig { returns(T.nilable(String)) }
        attr_accessor :ref

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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember7::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        end

        sig do
          override.returns(
            {
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type: Courier::ElementalNode::UnionMember7::Type::OrSymbol
            }
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

          QUOTE =
            T.let(
              :quote,
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

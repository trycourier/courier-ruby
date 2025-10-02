# typed: strong

module Courier
  module Models
    module Tenants
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
              Courier::Tenants::ElementalNode::UnionMember0,
              Courier::Tenants::ElementalNode::UnionMember1,
              Courier::Tenants::ElementalNode::UnionMember2,
              Courier::Tenants::ElementalNode::UnionMember3,
              Courier::Tenants::ElementalNode::UnionMember4,
              Courier::Tenants::ElementalNode::UnionMember5,
              Courier::Tenants::ElementalNode::UnionMember6,
              Courier::Tenants::ElementalNode::UnionMember7
            )
          end

        class UnionMember0 < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Tenants::ElementalNode::UnionMember0,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember0::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember0::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember0::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember0::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember0::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                Courier::Tenants::ElementalNode::UnionMember0::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember0::Type::TaggedSymbol
                ]
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
                Courier::Tenants::ElementalNode::UnionMember1,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember1::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember1::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember1::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember1::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember1::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            META =
              T.let(
                :meta,
                Courier::Tenants::ElementalNode::UnionMember1::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember1::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember2 < Courier::Models::Tenants::ElementalChannelNode
          OrHash =
            T.type_alias do
              T.any(
                Courier::Tenants::ElementalNode::UnionMember2,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember2::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember2::Type::OrSymbol
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
              type:
                Courier::Tenants::ElementalNode::UnionMember2::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type: nil)
          end

          sig do
            override.returns(
              {
                type:
                  Courier::Tenants::ElementalNode::UnionMember2::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember2::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHANNEL =
              T.let(
                :channel,
                Courier::Tenants::ElementalNode::UnionMember2::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember2::Type::TaggedSymbol
                ]
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
                Courier::Tenants::ElementalNode::UnionMember3,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember3::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember3::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember3::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember3::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember3::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE =
              T.let(
                :image,
                Courier::Tenants::ElementalNode::UnionMember3::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember3::Type::TaggedSymbol
                ]
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
                Courier::Tenants::ElementalNode::UnionMember4,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember4::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember4::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember4::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember4::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember4::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTION =
              T.let(
                :action,
                Courier::Tenants::ElementalNode::UnionMember4::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember4::Type::TaggedSymbol
                ]
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
                Courier::Tenants::ElementalNode::UnionMember5,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember5::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember5::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember5::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember5::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember5::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DIVIDER =
              T.let(
                :divider,
                Courier::Tenants::ElementalNode::UnionMember5::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember5::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember6 < Courier::Models::Tenants::ElementalGroupNode
          OrHash =
            T.type_alias do
              T.any(
                Courier::Tenants::ElementalNode::UnionMember6,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember6::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember6::Type::OrSymbol
            ).void
          end
          attr_writer :type

          # Allows you to group elements together. This can be useful when used in
          # combination with "if" or "loop". See
          # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
          # for more details.
          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember6::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type: nil)
          end

          sig do
            override.returns(
              {
                type:
                  Courier::Tenants::ElementalNode::UnionMember6::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember6::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GROUP =
              T.let(
                :group,
                Courier::Tenants::ElementalNode::UnionMember6::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember6::Type::TaggedSymbol
                ]
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
                Courier::Tenants::ElementalNode::UnionMember7,
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
              T.nilable(
                Courier::Tenants::ElementalNode::UnionMember7::Type::OrSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                Courier::Tenants::ElementalNode::UnionMember7::Type::OrSymbol
            ).void
          end
          attr_writer :type

          sig do
            params(
              channels: T.nilable(T::Array[String]),
              if_: T.nilable(String),
              loop_: T.nilable(String),
              ref: T.nilable(String),
              type:
                Courier::Tenants::ElementalNode::UnionMember7::Type::OrSymbol
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
                type:
                  Courier::Tenants::ElementalNode::UnionMember7::Type::OrSymbol
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
                  Courier::Tenants::ElementalNode::UnionMember7::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            QUOTE =
              T.let(
                :quote,
                Courier::Tenants::ElementalNode::UnionMember7::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Tenants::ElementalNode::UnionMember7::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(T::Array[Courier::Tenants::ElementalNode::Variants])
        end
        def self.variants
        end
      end
    end
  end
end

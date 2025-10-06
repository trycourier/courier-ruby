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

        # A unique id used to identify the action when it is executed.
        sig { returns(T.nilable(String)) }
        attr_accessor :action_id

        # The alignment of the action button. Defaults to "center".
        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember4::Align::OrSymbol)
          )
        end
        attr_accessor :align

        # The background color of the action button.
        sig { returns(T.nilable(String)) }
        attr_accessor :background_color

        # The text content of the action shown to the user.
        sig { returns(T.nilable(String)) }
        attr_reader :content

        sig { params(content: String).void }
        attr_writer :content

        # The target URL of the action.
        sig { returns(T.nilable(String)) }
        attr_reader :href

        sig { params(href: String).void }
        attr_writer :href

        # Region specific content. See
        # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
        # for more details.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::ElementalNode::UnionMember4::Locale]
            )
          )
        end
        attr_accessor :locales

        # Defaults to `button`.
        sig do
          returns(
            T.nilable(Courier::ElementalNode::UnionMember4::Style::OrSymbol)
          )
        end
        attr_accessor :style

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
            action_id: T.nilable(String),
            align:
              T.nilable(Courier::ElementalNode::UnionMember4::Align::OrSymbol),
            background_color: T.nilable(String),
            content: String,
            href: String,
            locales:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::ElementalNode::UnionMember4::Locale::OrHash
                ]
              ),
            style:
              T.nilable(Courier::ElementalNode::UnionMember4::Style::OrSymbol),
            type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique id used to identify the action when it is executed.
          action_id: nil,
          # The alignment of the action button. Defaults to "center".
          align: nil,
          # The background color of the action button.
          background_color: nil,
          # The text content of the action shown to the user.
          content: nil,
          # The target URL of the action.
          href: nil,
          # Region specific content. See
          # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
          # for more details.
          locales: nil,
          # Defaults to `button`.
          style: nil,
          type: nil
        )
        end

        sig do
          override.returns(
            {
              action_id: T.nilable(String),
              align:
                T.nilable(
                  Courier::ElementalNode::UnionMember4::Align::OrSymbol
                ),
              background_color: T.nilable(String),
              content: String,
              href: String,
              locales:
                T.nilable(
                  T::Hash[Symbol, Courier::ElementalNode::UnionMember4::Locale]
                ),
              style:
                T.nilable(
                  Courier::ElementalNode::UnionMember4::Style::OrSymbol
                ),
              type: Courier::ElementalNode::UnionMember4::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The alignment of the action button. Defaults to "center".
        module Align
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember4::Align)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CENTER =
            T.let(
              :center,
              Courier::ElementalNode::UnionMember4::Align::TaggedSymbol
            )
          LEFT =
            T.let(
              :left,
              Courier::ElementalNode::UnionMember4::Align::TaggedSymbol
            )
          RIGHT =
            T.let(
              :right,
              Courier::ElementalNode::UnionMember4::Align::TaggedSymbol
            )
          FULL =
            T.let(
              :full,
              Courier::ElementalNode::UnionMember4::Align::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNode::UnionMember4::Align::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Locale < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::ElementalNode::UnionMember4::Locale,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :content

          sig { params(content: String).returns(T.attached_class) }
          def self.new(content:)
          end

          sig { override.returns({ content: String }) }
          def to_hash
          end
        end

        # Defaults to `button`.
        module Style
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::ElementalNode::UnionMember4::Style)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BUTTON =
            T.let(
              :button,
              Courier::ElementalNode::UnionMember4::Style::TaggedSymbol
            )
          LINK =
            T.let(
              :link,
              Courier::ElementalNode::UnionMember4::Style::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::ElementalNode::UnionMember4::Style::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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

      class UnionMember6 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::ElementalNode::UnionMember6,
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
            channels: T.nilable(T::Array[String]),
            if_: T.nilable(String),
            loop_: T.nilable(String),
            ref: T.nilable(String),
            type: Courier::ElementalNode::UnionMember6::Type::OrSymbol
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
              type: Courier::ElementalNode::UnionMember6::Type::OrSymbol
            }
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

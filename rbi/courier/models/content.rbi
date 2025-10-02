# typed: strong

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Content::ElementalContent,
            Courier::Content::ElementalContentSugar
          )
        end

      class ElementalContent < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Content::ElementalContent,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              T.any(
                Courier::Content::ElementalContent::Element::UnionMember0,
                Courier::Content::ElementalContent::Element::UnionMember1,
                Courier::Content::ElementalContent::Element::UnionMember2,
                Courier::Content::ElementalContent::Element::UnionMember3,
                Courier::Content::ElementalContent::Element::UnionMember4,
                Courier::Content::ElementalContent::Element::UnionMember5
              )
            ]
          )
        end
        attr_accessor :elements

        # For example, "2022-01-01"
        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(T.anything)) }
        attr_reader :brand

        sig { params(brand: T.anything).void }
        attr_writer :brand

        sig do
          params(
            elements:
              T::Array[
                T.any(
                  Courier::Content::ElementalContent::Element::UnionMember0::OrHash,
                  Courier::Content::ElementalContent::Element::UnionMember1::OrHash,
                  Courier::Content::ElementalContent::Element::UnionMember2::OrHash,
                  Courier::Content::ElementalContent::Element::UnionMember3::OrHash,
                  Courier::Content::ElementalContent::Element::UnionMember4::OrHash,
                  Courier::Content::ElementalContent::Element::UnionMember5::OrHash
                )
              ],
            version: String,
            brand: T.anything
          ).returns(T.attached_class)
        end
        def self.new(
          elements:,
          # For example, "2022-01-01"
          version:,
          brand: nil
        )
        end

        sig do
          override.returns(
            {
              elements:
                T::Array[
                  T.any(
                    Courier::Content::ElementalContent::Element::UnionMember0,
                    Courier::Content::ElementalContent::Element::UnionMember1,
                    Courier::Content::ElementalContent::Element::UnionMember2,
                    Courier::Content::ElementalContent::Element::UnionMember3,
                    Courier::Content::ElementalContent::Element::UnionMember4,
                    Courier::Content::ElementalContent::Element::UnionMember5
                  )
                ],
              version: String,
              brand: T.anything
            }
          )
        end
        def to_hash
        end

        module Element
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::Content::ElementalContent::Element::UnionMember0,
                Courier::Content::ElementalContent::Element::UnionMember1,
                Courier::Content::ElementalContent::Element::UnionMember2,
                Courier::Content::ElementalContent::Element::UnionMember3,
                Courier::Content::ElementalContent::Element::UnionMember4,
                Courier::Content::ElementalContent::Element::UnionMember5
              )
            end

          class UnionMember0 < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Content::ElementalContent::Element::UnionMember0,
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
                  Courier::Content::ElementalContent::Element::UnionMember0::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember0::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember0::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember0::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember0::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  Courier::Content::ElementalContent::Element::UnionMember0::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember0::Type::TaggedSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember1,
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
                  Courier::Content::ElementalContent::Element::UnionMember1::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember1::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember1::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember1::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember1::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              META =
                T.let(
                  :meta,
                  Courier::Content::ElementalContent::Element::UnionMember1::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember1::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember2 < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Content::ElementalContent::Element::UnionMember2,
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
                  Courier::Content::ElementalContent::Element::UnionMember2::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember2::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember2::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember2::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember2::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IMAGE =
                T.let(
                  :image,
                  Courier::Content::ElementalContent::Element::UnionMember2::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember2::Type::TaggedSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember3,
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
                  Courier::Content::ElementalContent::Element::UnionMember3::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember3::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember3::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember3::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember3::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTION =
                T.let(
                  :action,
                  Courier::Content::ElementalContent::Element::UnionMember3::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember3::Type::TaggedSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember4,
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
                  Courier::Content::ElementalContent::Element::UnionMember4::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember4::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember4::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember4::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember4::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DIVIDER =
                T.let(
                  :divider,
                  Courier::Content::ElementalContent::Element::UnionMember4::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember4::Type::TaggedSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember5,
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
                  Courier::Content::ElementalContent::Element::UnionMember5::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Content::ElementalContent::Element::UnionMember5::Type::OrSymbol
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
                  Courier::Content::ElementalContent::Element::UnionMember5::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              channels: nil,
              if_: nil,
              loop_: nil,
              ref: nil,
              type: nil
            )
            end

            sig do
              override.returns(
                {
                  channels: T.nilable(T::Array[String]),
                  if_: T.nilable(String),
                  loop_: T.nilable(String),
                  ref: T.nilable(String),
                  type:
                    Courier::Content::ElementalContent::Element::UnionMember5::Type::OrSymbol
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
                    Courier::Content::ElementalContent::Element::UnionMember5::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              QUOTE =
                T.let(
                  :quote,
                  Courier::Content::ElementalContent::Element::UnionMember5::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Content::ElementalContent::Element::UnionMember5::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[Courier::Content::ElementalContent::Element::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Content::ElementalContentSugar,
              Courier::Internal::AnyHash
            )
          end

        # The text content displayed in the notification.
        sig { returns(String) }
        attr_accessor :body

        # The title to be displayed by supported channels i.e. push, email (as subject)
        sig { returns(String) }
        attr_accessor :title

        # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig { params(body: String, title: String).returns(T.attached_class) }
        def self.new(
          # The text content displayed in the notification.
          body:,
          # The title to be displayed by supported channels i.e. push, email (as subject)
          title:
        )
        end

        sig { override.returns({ body: String, title: String }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Courier::Content::Variants]) }
      def self.variants
      end
    end
  end
end

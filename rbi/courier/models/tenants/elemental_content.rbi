# typed: strong

module Courier
  module Models
    module Tenants
      class ElementalContent < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Tenants::ElementalContent,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              T.any(
                Courier::Tenants::ElementalContent::Element::UnionMember0,
                Courier::Tenants::ElementalContent::Element::UnionMember1,
                Courier::Tenants::ElementalContent::Element::UnionMember2,
                Courier::Tenants::ElementalContent::Element::UnionMember3,
                Courier::Tenants::ElementalContent::Element::UnionMember4,
                Courier::Tenants::ElementalContent::Element::UnionMember5,
                Courier::Tenants::ElementalContent::Element::UnionMember6
              )
            ]
          )
        end
        attr_accessor :elements

        # For example, "2022-01-01"
        sig { returns(String) }
        attr_accessor :version

        sig { returns(T.nilable(String)) }
        attr_accessor :brand

        sig do
          params(
            elements:
              T::Array[
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember0::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember1::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember2::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember3::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember4::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember5::OrHash,
                  Courier::Tenants::ElementalContent::Element::UnionMember6::OrHash
                )
              ],
            version: String,
            brand: T.nilable(String)
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
                    Courier::Tenants::ElementalContent::Element::UnionMember0,
                    Courier::Tenants::ElementalContent::Element::UnionMember1,
                    Courier::Tenants::ElementalContent::Element::UnionMember2,
                    Courier::Tenants::ElementalContent::Element::UnionMember3,
                    Courier::Tenants::ElementalContent::Element::UnionMember4,
                    Courier::Tenants::ElementalContent::Element::UnionMember5,
                    Courier::Tenants::ElementalContent::Element::UnionMember6
                  )
                ],
              version: String,
              brand: T.nilable(String)
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
                Courier::Tenants::ElementalContent::Element::UnionMember0,
                Courier::Tenants::ElementalContent::Element::UnionMember1,
                Courier::Tenants::ElementalContent::Element::UnionMember2,
                Courier::Tenants::ElementalContent::Element::UnionMember3,
                Courier::Tenants::ElementalContent::Element::UnionMember4,
                Courier::Tenants::ElementalContent::Element::UnionMember5,
                Courier::Tenants::ElementalContent::Element::UnionMember6
              )
            end

          class UnionMember0 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember0,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember0::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember0::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember0::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember0::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember0::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  Courier::Tenants::ElementalContent::Element::UnionMember0::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember0::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember1 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember1,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember1::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember1::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember1::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember1::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember1::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              META =
                T.let(
                  :meta,
                  Courier::Tenants::ElementalContent::Element::UnionMember1::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember1::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember2 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember2,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember2::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember2::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember2::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember2::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember2::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CHANNEL =
                T.let(
                  :channel,
                  Courier::Tenants::ElementalContent::Element::UnionMember2::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember2::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember3 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember3,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember3::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember3::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember3::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember3::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember3::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              IMAGE =
                T.let(
                  :image,
                  Courier::Tenants::ElementalContent::Element::UnionMember3::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember3::Type::TaggedSymbol
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
                  Courier::Tenants::ElementalContent::Element::UnionMember4,
                  Courier::Internal::AnyHash
                )
              end

            # A unique id used to identify the action when it is executed.
            sig { returns(T.nilable(String)) }
            attr_accessor :action_id

            # The alignment of the action button. Defaults to "center".
            sig { returns(T.nilable(Courier::Tenants::Alignment::OrSymbol)) }
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
                  T::Hash[
                    Symbol,
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Locale
                  ]
                )
              )
            end
            attr_accessor :locales

            # Defaults to `button`.
            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Style::OrSymbol
                )
              )
            end
            attr_accessor :style

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                action_id: T.nilable(String),
                align: T.nilable(Courier::Tenants::Alignment::OrSymbol),
                background_color: T.nilable(String),
                content: String,
                href: String,
                locales:
                  T.nilable(
                    T::Hash[
                      Symbol,
                      Courier::Tenants::ElementalContent::Element::UnionMember4::Locale::OrHash
                    ]
                  ),
                style:
                  T.nilable(
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Style::OrSymbol
                  ),
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Type::OrSymbol
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
                  align: T.nilable(Courier::Tenants::Alignment::OrSymbol),
                  background_color: T.nilable(String),
                  content: String,
                  href: String,
                  locales:
                    T.nilable(
                      T::Hash[
                        Symbol,
                        Courier::Tenants::ElementalContent::Element::UnionMember4::Locale
                      ]
                    ),
                  style:
                    T.nilable(
                      Courier::Tenants::ElementalContent::Element::UnionMember4::Style::OrSymbol
                    ),
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            class Locale < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Locale,
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
                  T.all(
                    Symbol,
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Style
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              BUTTON =
                T.let(
                  :button,
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Style::TaggedSymbol
                )
              LINK =
                T.let(
                  :link,
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Style::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Style::TaggedSymbol
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
                  T.all(
                    Symbol,
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTION =
                T.let(
                  :action,
                  Courier::Tenants::ElementalContent::Element::UnionMember4::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember4::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember5 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember5,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember5::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember5::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember5::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember5::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember5::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DIVIDER =
                T.let(
                  :divider,
                  Courier::Tenants::ElementalContent::Element::UnionMember5::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember5::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class UnionMember6 < Courier::Models::Tenants::ElementalBaseNode
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Tenants::ElementalContent::Element::UnionMember6,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::Tenants::ElementalContent::Element::UnionMember6::Type::OrSymbol
                )
              )
            end
            attr_reader :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember6::Type::OrSymbol
              ).void
            end
            attr_writer :type

            sig do
              params(
                type:
                  Courier::Tenants::ElementalContent::Element::UnionMember6::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(type: nil)
            end

            sig do
              override.returns(
                {
                  type:
                    Courier::Tenants::ElementalContent::Element::UnionMember6::Type::OrSymbol
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
                    Courier::Tenants::ElementalContent::Element::UnionMember6::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              QUOTE =
                T.let(
                  :quote,
                  Courier::Tenants::ElementalContent::Element::UnionMember6::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Tenants::ElementalContent::Element::UnionMember6::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          sig do
            override.returns(
              T::Array[Courier::Tenants::ElementalContent::Element::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalContent < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::Tenants::ElementalContent::Element::UnionMember0, Courier::Models::Tenants::ElementalContent::Element::UnionMember1, Courier::Models::Tenants::ElementalContent::Element::UnionMember2, Courier::Models::Tenants::ElementalContent::Element::UnionMember3, Courier::Models::Tenants::ElementalContent::Element::UnionMember4, Courier::Models::Tenants::ElementalContent::Element::UnionMember5, Courier::Models::Tenants::ElementalContent::Element::UnionMember6>]
        required :elements,
                 -> { Courier::Internal::Type::ArrayOf[union: Courier::Tenants::ElementalContent::Element] }

        # @!attribute version
        #   For example, "2022-01-01"
        #
        #   @return [String]
        required :version, String

        # @!attribute brand
        #
        #   @return [String, nil]
        optional :brand, String, nil?: true

        # @!method initialize(elements:, version:, brand: nil)
        #   @param elements [Array<Courier::Models::Tenants::ElementalContent::Element::UnionMember0, Courier::Models::Tenants::ElementalContent::Element::UnionMember1, Courier::Models::Tenants::ElementalContent::Element::UnionMember2, Courier::Models::Tenants::ElementalContent::Element::UnionMember3, Courier::Models::Tenants::ElementalContent::Element::UnionMember4, Courier::Models::Tenants::ElementalContent::Element::UnionMember5, Courier::Models::Tenants::ElementalContent::Element::UnionMember6>]
        #
        #   @param version [String] For example, "2022-01-01"
        #
        #   @param brand [String, nil]

        module Element
          extend Courier::Internal::Type::Union

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember0 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember1 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember2 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember3 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember4 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember5 }

          variant -> { Courier::Tenants::ElementalContent::Element::UnionMember6 }

          class UnionMember0 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember0::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember0::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember0::Type]

            module Type
              extend Courier::Internal::Type::Enum

              TEXT = :text

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember1 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember1::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember1::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember1::Type]

            module Type
              extend Courier::Internal::Type::Enum

              META = :meta

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember2 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember2::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember2::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember2::Type]

            module Type
              extend Courier::Internal::Type::Enum

              CHANNEL = :channel

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember3 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember3::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember3::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember3::Type]

            module Type
              extend Courier::Internal::Type::Enum

              IMAGE = :image

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember4 < Courier::Internal::Type::BaseModel
            # @!attribute action_id
            #   A unique id used to identify the action when it is executed.
            #
            #   @return [String, nil]
            optional :action_id, String, nil?: true

            # @!attribute align
            #   The alignment of the action button. Defaults to "center".
            #
            #   @return [Symbol, Courier::Models::Tenants::Alignment, nil]
            optional :align, enum: -> { Courier::Tenants::Alignment }, nil?: true

            # @!attribute background_color
            #   The background color of the action button.
            #
            #   @return [String, nil]
            optional :background_color, String, nil?: true

            # @!attribute content
            #   The text content of the action shown to the user.
            #
            #   @return [String, nil]
            optional :content, String

            # @!attribute href
            #   The target URL of the action.
            #
            #   @return [String, nil]
            optional :href, String

            # @!attribute locales
            #   Region specific content. See
            #   [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
            #   for more details.
            #
            #   @return [Hash{Symbol=>Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Locale}, nil]
            optional :locales,
                     -> {
                       Courier::Internal::Type::HashOf[Courier::Tenants::ElementalContent::Element::UnionMember4::Locale]
                     },
                     nil?: true

            # @!attribute style
            #   Defaults to `button`.
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Style, nil]
            optional :style,
                     enum: -> {
                       Courier::Tenants::ElementalContent::Element::UnionMember4::Style
                     },
                     nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember4::Type }

            # @!method initialize(action_id: nil, align: nil, background_color: nil, content: nil, href: nil, locales: nil, style: nil, type: nil)
            #   Some parameter documentations has been truncated, see
            #   {Courier::Models::Tenants::ElementalContent::Element::UnionMember4} for more
            #   details.
            #
            #   @param action_id [String, nil] A unique id used to identify the action when it is executed.
            #
            #   @param align [Symbol, Courier::Models::Tenants::Alignment, nil] The alignment of the action button. Defaults to "center".
            #
            #   @param background_color [String, nil] The background color of the action button.
            #
            #   @param content [String] The text content of the action shown to the user.
            #
            #   @param href [String] The target URL of the action.
            #
            #   @param locales [Hash{Symbol=>Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Locale}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
            #
            #   @param style [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Style, nil] Defaults to `button`.
            #
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember4::Type]

            class Locale < Courier::Internal::Type::BaseModel
              # @!attribute content
              #
              #   @return [String]
              required :content, String

              # @!method initialize(content:)
              #   @param content [String]
            end

            # Defaults to `button`.
            #
            # @see Courier::Models::Tenants::ElementalContent::Element::UnionMember4#style
            module Style
              extend Courier::Internal::Type::Enum

              BUTTON = :button
              LINK = :link

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Courier::Models::Tenants::ElementalContent::Element::UnionMember4#type
            module Type
              extend Courier::Internal::Type::Enum

              ACTION = :action

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember5 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember5::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember5::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember5::Type]

            module Type
              extend Courier::Internal::Type::Enum

              DIVIDER = :divider

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember6 < Courier::Models::Tenants::ElementalBaseNode
            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember6::Type, nil]
            optional :type, enum: -> { Courier::Tenants::ElementalContent::Element::UnionMember6::Type }

            # @!method initialize(type: nil)
            #   @param type [Symbol, Courier::Models::Tenants::ElementalContent::Element::UnionMember6::Type]

            module Type
              extend Courier::Internal::Type::Enum

              QUOTE = :quote

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::Tenants::ElementalContent::Element::UnionMember0, Courier::Models::Tenants::ElementalContent::Element::UnionMember1, Courier::Models::Tenants::ElementalContent::Element::UnionMember2, Courier::Models::Tenants::ElementalContent::Element::UnionMember3, Courier::Models::Tenants::ElementalContent::Element::UnionMember4, Courier::Models::Tenants::ElementalContent::Element::UnionMember5, Courier::Models::Tenants::ElementalContent::Element::UnionMember6)]
        end
      end
    end
  end
end

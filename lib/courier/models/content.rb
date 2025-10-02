# frozen_string_literal: true

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      variant -> { Courier::Content::ElementalContent }

      # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
      variant -> { Courier::Content::ElementalContentSugar }

      class ElementalContent < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::Content::ElementalContent::Element::UnionMember0, Courier::Models::Content::ElementalContent::Element::UnionMember1, Courier::Models::Content::ElementalContent::Element::UnionMember2, Courier::Models::Content::ElementalContent::Element::UnionMember3, Courier::Models::Content::ElementalContent::Element::UnionMember4, Courier::Models::Content::ElementalContent::Element::UnionMember5>]
        required :elements,
                 -> { Courier::Internal::Type::ArrayOf[union: Courier::Content::ElementalContent::Element] }

        # @!attribute version
        #   For example, "2022-01-01"
        #
        #   @return [String]
        required :version, String

        # @!attribute brand
        #
        #   @return [Object, nil]
        optional :brand, Courier::Internal::Type::Unknown

        # @!method initialize(elements:, version:, brand: nil)
        #   @param elements [Array<Courier::Models::Content::ElementalContent::Element::UnionMember0, Courier::Models::Content::ElementalContent::Element::UnionMember1, Courier::Models::Content::ElementalContent::Element::UnionMember2, Courier::Models::Content::ElementalContent::Element::UnionMember3, Courier::Models::Content::ElementalContent::Element::UnionMember4, Courier::Models::Content::ElementalContent::Element::UnionMember5>]
        #
        #   @param version [String] For example, "2022-01-01"
        #
        #   @param brand [Object]

        module Element
          extend Courier::Internal::Type::Union

          variant -> { Courier::Content::ElementalContent::Element::UnionMember0 }

          variant -> { Courier::Content::ElementalContent::Element::UnionMember1 }

          variant -> { Courier::Content::ElementalContent::Element::UnionMember2 }

          variant -> { Courier::Content::ElementalContent::Element::UnionMember3 }

          variant -> { Courier::Content::ElementalContent::Element::UnionMember4 }

          variant -> { Courier::Content::ElementalContent::Element::UnionMember5 }

          class UnionMember0 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember0::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember0::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember0::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember0#type
            module Type
              extend Courier::Internal::Type::Enum

              TEXT = :text

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember1 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember1::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember1::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember1::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember1#type
            module Type
              extend Courier::Internal::Type::Enum

              META = :meta

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember2 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember2::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember2::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember2::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember2#type
            module Type
              extend Courier::Internal::Type::Enum

              IMAGE = :image

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember3 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember3::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember3::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember3::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember3#type
            module Type
              extend Courier::Internal::Type::Enum

              ACTION = :action

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember4 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember4::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember4::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember4::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember4#type
            module Type
              extend Courier::Internal::Type::Enum

              DIVIDER = :divider

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          class UnionMember5 < Courier::Internal::Type::BaseModel
            # @!attribute channels
            #
            #   @return [Array<String>, nil]
            optional :channels, Courier::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute if_
            #
            #   @return [String, nil]
            optional :if_, String, api_name: :if, nil?: true

            # @!attribute loop_
            #
            #   @return [String, nil]
            optional :loop_, String, api_name: :loop, nil?: true

            # @!attribute ref
            #
            #   @return [String, nil]
            optional :ref, String, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember5::Type, nil]
            optional :type, enum: -> { Courier::Content::ElementalContent::Element::UnionMember5::Type }

            # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
            #   @param channels [Array<String>, nil]
            #   @param if_ [String, nil]
            #   @param loop_ [String, nil]
            #   @param ref [String, nil]
            #   @param type [Symbol, Courier::Models::Content::ElementalContent::Element::UnionMember5::Type]

            # @see Courier::Models::Content::ElementalContent::Element::UnionMember5#type
            module Type
              extend Courier::Internal::Type::Enum

              QUOTE = :quote

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::Content::ElementalContent::Element::UnionMember0, Courier::Models::Content::ElementalContent::Element::UnionMember1, Courier::Models::Content::ElementalContent::Element::UnionMember2, Courier::Models::Content::ElementalContent::Element::UnionMember3, Courier::Models::Content::ElementalContent::Element::UnionMember4, Courier::Models::Content::ElementalContent::Element::UnionMember5)]
        end
      end

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        # @!attribute body
        #   The text content displayed in the notification.
        #
        #   @return [String]
        required :body, String

        # @!attribute title
        #   The title to be displayed by supported channels i.e. push, email (as subject)
        #
        #   @return [String]
        required :title, String

        # @!method initialize(body:, title:)
        #   Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @param body [String] The text content displayed in the notification.
        #
        #   @param title [String] The title to be displayed by supported channels i.e. push, email (as subject)
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::Content::ElementalContent, Courier::Models::Content::ElementalContentSugar)]
    end
  end
end

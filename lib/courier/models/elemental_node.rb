# frozen_string_literal: true

module Courier
  module Models
    module ElementalNode
      extend Courier::Internal::Type::Union

      variant -> { Courier::ElementalNode::UnionMember0 }

      variant -> { Courier::ElementalNode::UnionMember1 }

      variant -> { Courier::ElementalNode::UnionMember2 }

      variant -> { Courier::ElementalNode::UnionMember3 }

      variant -> { Courier::ElementalNode::UnionMember4 }

      variant -> { Courier::ElementalNode::UnionMember5 }

      variant -> { Courier::ElementalNode::UnionMember6 }

      variant -> { Courier::ElementalNode::UnionMember7 }

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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember0::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember0::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember0::Type]

        # @see Courier::Models::ElementalNode::UnionMember0#type
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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember1::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember1::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember1::Type]

        # @see Courier::Models::ElementalNode::UnionMember1#type
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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember2::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember2::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember2::Type]

        # @see Courier::Models::ElementalNode::UnionMember2#type
        module Type
          extend Courier::Internal::Type::Enum

          CHANNEL = :channel

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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember3::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember3::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember3::Type]

        # @see Courier::Models::ElementalNode::UnionMember3#type
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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember4::Align, nil]
        optional :align, enum: -> { Courier::ElementalNode::UnionMember4::Align }, nil?: true

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
        #   @return [Hash{Symbol=>Courier::Models::ElementalNode::UnionMember4::Locale}, nil]
        optional :locales,
                 -> { Courier::Internal::Type::HashOf[Courier::ElementalNode::UnionMember4::Locale] },
                 nil?: true

        # @!attribute style
        #   Defaults to `button`.
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember4::Style, nil]
        optional :style, enum: -> { Courier::ElementalNode::UnionMember4::Style }, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember4::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember4::Type }

        # @!method initialize(action_id: nil, align: nil, background_color: nil, content: nil, href: nil, locales: nil, style: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::ElementalNode::UnionMember4} for more details.
        #
        #   @param action_id [String, nil] A unique id used to identify the action when it is executed.
        #
        #   @param align [Symbol, Courier::Models::ElementalNode::UnionMember4::Align, nil] The alignment of the action button. Defaults to "center".
        #
        #   @param background_color [String, nil] The background color of the action button.
        #
        #   @param content [String] The text content of the action shown to the user.
        #
        #   @param href [String] The target URL of the action.
        #
        #   @param locales [Hash{Symbol=>Courier::Models::ElementalNode::UnionMember4::Locale}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
        #
        #   @param style [Symbol, Courier::Models::ElementalNode::UnionMember4::Style, nil] Defaults to `button`.
        #
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember4::Type]

        # The alignment of the action button. Defaults to "center".
        #
        # @see Courier::Models::ElementalNode::UnionMember4#align
        module Align
          extend Courier::Internal::Type::Enum

          CENTER = :center
          LEFT = :left
          RIGHT = :right
          FULL = :full

          # @!method self.values
          #   @return [Array<Symbol>]
        end

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
        # @see Courier::Models::ElementalNode::UnionMember4#style
        module Style
          extend Courier::Internal::Type::Enum

          BUTTON = :button
          LINK = :link

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::ElementalNode::UnionMember4#type
        module Type
          extend Courier::Internal::Type::Enum

          ACTION = :action

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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember5::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember5::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember5::Type]

        # @see Courier::Models::ElementalNode::UnionMember5#type
        module Type
          extend Courier::Internal::Type::Enum

          DIVIDER = :divider

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember6 < Courier::Internal::Type::BaseModel
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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember6::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember6::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember6::Type]

        # @see Courier::Models::ElementalNode::UnionMember6#type
        module Type
          extend Courier::Internal::Type::Enum

          GROUP = :group

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember7 < Courier::Internal::Type::BaseModel
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
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember7::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember7::Type }

        # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
        #   @param channels [Array<String>, nil]
        #   @param if_ [String, nil]
        #   @param loop_ [String, nil]
        #   @param ref [String, nil]
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember7::Type]

        # @see Courier::Models::ElementalNode::UnionMember7#type
        module Type
          extend Courier::Internal::Type::Enum

          QUOTE = :quote

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6, Courier::Models::ElementalNode::UnionMember7)]
    end
  end
end

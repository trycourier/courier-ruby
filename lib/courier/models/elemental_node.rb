# frozen_string_literal: true

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

      variant -> { Courier::ElementalNode::UnionMember0 }

      variant -> { Courier::ElementalNode::UnionMember1 }

      # The channel element allows a notification to be customized based on which channel it is sent through.
      # For example, you may want to display a detailed message when the notification is sent through email,
      # and a more concise message in a push notification. Channel elements are only valid as top-level
      # elements; you cannot nest channel elements. If there is a channel element specified at the top-level
      # of the document, all sibling elements must be channel elements.
      # Note: As an alternative, most elements support a `channel` property. Which allows you to selectively
      # display an individual element on a per channel basis. See the
      # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
      variant -> { Courier::ElementalNode::UnionMember2 }

      variant -> { Courier::ElementalNode::UnionMember3 }

      variant -> { Courier::ElementalNode::UnionMember4 }

      variant -> { Courier::ElementalNode::UnionMember5 }

      variant -> { Courier::ElementalNode::UnionMember6 }

      class UnionMember0 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember0::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember0::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember0::Type]

        module Type
          extend Courier::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember1 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember1::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember1::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember1::Type]

        module Type
          extend Courier::Internal::Type::Enum

          META = :meta

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember2 < Courier::Models::ElementalChannelNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember2::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember2::Type }

        # @!method initialize(type: nil)
        #   The channel element allows a notification to be customized based on which
        #   channel it is sent through. For example, you may want to display a detailed
        #   message when the notification is sent through email, and a more concise message
        #   in a push notification. Channel elements are only valid as top-level elements;
        #   you cannot nest channel elements. If there is a channel element specified at the
        #   top-level of the document, all sibling elements must be channel elements. Note:
        #   As an alternative, most elements support a `channel` property. Which allows you
        #   to selectively display an individual element on a per channel basis. See the
        #   [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
        #   for more details.
        #
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember2::Type]

        module Type
          extend Courier::Internal::Type::Enum

          CHANNEL = :channel

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember3 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember3::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember3::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember3::Type]

        module Type
          extend Courier::Internal::Type::Enum

          IMAGE = :image

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember4 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember4::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember4::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember4::Type]

        module Type
          extend Courier::Internal::Type::Enum

          ACTION = :action

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember5 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember5::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember5::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember5::Type]

        module Type
          extend Courier::Internal::Type::Enum

          DIVIDER = :divider

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember6 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember6::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember6::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember6::Type]

        module Type
          extend Courier::Internal::Type::Enum

          QUOTE = :quote

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6)]
    end
  end
end

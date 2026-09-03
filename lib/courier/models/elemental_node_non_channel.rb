# frozen_string_literal: true

module Courier
  module Models
    # Any Elemental node except a channel block. Channel elements are only valid as
    # top-level elements, so the `elements` nested inside one can never be another
    # channel. Keeping this union channel-free also keeps the schema acyclic; a
    # recursive `$ref` here breaks the generated Python models.
    module ElementalNodeNonChannel
      extend Courier::Internal::Type::Union

      # Represents a body of text to be rendered inside of the notification.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember0 }

      # The meta element contains information describing the notification that may  be used by a particular channel or provider. One important field is the title  field which will be used as the title for channels that support it.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember1 }

      # Used to embed an image into the notification.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember2 }

      # Allows the user to execute an action. Can be a button or a link.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember3 }

      # Renders a dividing line between elements.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember4 }

      # Renders a quote block.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember5 }

      # Raw HTML string inside an Elemental document. When rendering a message, this node is turned into output only for the email channel; for other channels it produces no blocks.
      variant -> { Courier::ElementalNodeNonChannel::UnionMember6 }

      class UnionMember0 < Courier::Models::ElementalTextNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember0::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember0::Type }

        # @!method initialize(type: nil)
        #   Represents a body of text to be rendered inside of the notification.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember0::Type]

        module Type
          extend Courier::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember1 < Courier::Models::ElementalMetaNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember1::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember1::Type }

        # @!method initialize(type: nil)
        #   The meta element contains information describing the notification that may be
        #   used by a particular channel or provider. One important field is the title field
        #   which will be used as the title for channels that support it.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember1::Type]

        module Type
          extend Courier::Internal::Type::Enum

          META = :meta

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember2 < Courier::Models::ElementalImageNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember2::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember2::Type }

        # @!method initialize(type: nil)
        #   Used to embed an image into the notification.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember2::Type]

        module Type
          extend Courier::Internal::Type::Enum

          IMAGE = :image

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember3 < Courier::Models::ElementalActionNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember3::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember3::Type }

        # @!method initialize(type: nil)
        #   Allows the user to execute an action. Can be a button or a link.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember3::Type]

        module Type
          extend Courier::Internal::Type::Enum

          ACTION = :action

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember4 < Courier::Models::ElementalDividerNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember4::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember4::Type }

        # @!method initialize(type: nil)
        #   Renders a dividing line between elements.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember4::Type]

        module Type
          extend Courier::Internal::Type::Enum

          DIVIDER = :divider

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember5 < Courier::Models::ElementalQuoteNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember5::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember5::Type }

        # @!method initialize(type: nil)
        #   Renders a quote block.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember5::Type]

        module Type
          extend Courier::Internal::Type::Enum

          QUOTE = :quote

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember6 < Courier::Models::ElementalHTMLNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember6::Type, nil]
        optional :type, enum: -> { Courier::ElementalNodeNonChannel::UnionMember6::Type }

        # @!method initialize(type: nil)
        #   Raw HTML string inside an Elemental document. When rendering a message, this
        #   node is turned into output only for the email channel; for other channels it
        #   produces no blocks.
        #
        #   @param type [Symbol, Courier::Models::ElementalNodeNonChannel::UnionMember6::Type]

        module Type
          extend Courier::Internal::Type::Enum

          HTML = :html

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::ElementalNodeNonChannel::UnionMember0, Courier::Models::ElementalNodeNonChannel::UnionMember1, Courier::Models::ElementalNodeNonChannel::UnionMember2, Courier::Models::ElementalNodeNonChannel::UnionMember3, Courier::Models::ElementalNodeNonChannel::UnionMember4, Courier::Models::ElementalNodeNonChannel::UnionMember5, Courier::Models::ElementalNodeNonChannel::UnionMember6)]
    end
  end
end

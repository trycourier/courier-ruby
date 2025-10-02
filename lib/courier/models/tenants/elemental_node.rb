# frozen_string_literal: true

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

        variant -> { Courier::Tenants::ElementalNode::UnionMember0 }

        variant -> { Courier::Tenants::ElementalNode::UnionMember1 }

        # The channel element allows a notification to be customized based on which channel it is sent through.
        # For example, you may want to display a detailed message when the notification is sent through email,
        # and a more concise message in a push notification. Channel elements are only valid as top-level
        # elements; you cannot nest channel elements. If there is a channel element specified at the top-level
        # of the document, all sibling elements must be channel elements.
        # Note: As an alternative, most elements support a `channel` property. Which allows you to selectively
        # display an individual element on a per channel basis. See the
        # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
        variant -> { Courier::Tenants::ElementalNode::UnionMember2 }

        variant -> { Courier::Tenants::ElementalNode::UnionMember3 }

        variant -> { Courier::Tenants::ElementalNode::UnionMember4 }

        variant -> { Courier::Tenants::ElementalNode::UnionMember5 }

        # Allows you to group elements together. This can be useful when used in combination with "if" or "loop". See [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
        variant -> { Courier::Tenants::ElementalNode::UnionMember6 }

        variant -> { Courier::Tenants::ElementalNode::UnionMember7 }

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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember0::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember0::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember0::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember0#type
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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember1::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember1::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember1::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember1#type
          module Type
            extend Courier::Internal::Type::Enum

            META = :meta

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class UnionMember2 < Courier::Models::Tenants::ElementalChannelNode
          # @!attribute type
          #
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember2::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember2::Type }

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
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember2::Type]

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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember3::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember3::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember3::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember3#type
          module Type
            extend Courier::Internal::Type::Enum

            IMAGE = :image

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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember4::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember4::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember4::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember4#type
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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember5::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember5::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember5::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember5#type
          module Type
            extend Courier::Internal::Type::Enum

            DIVIDER = :divider

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class UnionMember6 < Courier::Models::Tenants::ElementalGroupNode
          # @!attribute type
          #
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember6::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember6::Type }

          # @!method initialize(type: nil)
          #   Allows you to group elements together. This can be useful when used in
          #   combination with "if" or "loop". See
          #   [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
          #   for more details.
          #
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember6::Type]

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
          #   @return [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember7::Type, nil]
          optional :type, enum: -> { Courier::Tenants::ElementalNode::UnionMember7::Type }

          # @!method initialize(channels: nil, if_: nil, loop_: nil, ref: nil, type: nil)
          #   @param channels [Array<String>, nil]
          #   @param if_ [String, nil]
          #   @param loop_ [String, nil]
          #   @param ref [String, nil]
          #   @param type [Symbol, Courier::Models::Tenants::ElementalNode::UnionMember7::Type]

          # @see Courier::Models::Tenants::ElementalNode::UnionMember7#type
          module Type
            extend Courier::Internal::Type::Enum

            QUOTE = :quote

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Courier::Models::Tenants::ElementalNode::UnionMember0, Courier::Models::Tenants::ElementalNode::UnionMember1, Courier::Models::Tenants::ElementalNode::UnionMember2, Courier::Models::Tenants::ElementalNode::UnionMember3, Courier::Models::Tenants::ElementalNode::UnionMember4, Courier::Models::Tenants::ElementalNode::UnionMember5, Courier::Models::Tenants::ElementalNode::UnionMember6, Courier::Models::Tenants::ElementalNode::UnionMember7)]
      end
    end
  end
end

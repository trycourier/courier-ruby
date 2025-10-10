# frozen_string_literal: true

module Trycourier
  module Models
    module InboundBulkMessage
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::InboundBulkMessage::InboundBulkTemplateMessage }

      variant -> { Trycourier::InboundBulkMessage::InboundBulkContentMessage }

      class InboundBulkTemplateMessage < Trycourier::Internal::Type::BaseModel
        # @!attribute template
        #
        #   @return [String]
        required :template, String

        # @!attribute brand
        #
        #   @return [String, nil]
        optional :brand, String, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

        # @!attribute event
        #
        #   @return [String, nil]
        optional :event, String, nil?: true

        # @!attribute locale
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :locale,
                 Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute override
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override,
                 Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
                 nil?: true

        # @!method initialize(template:, brand: nil, data: nil, event: nil, locale: nil, override: nil)
        #   @param template [String]
        #   @param brand [String, nil]
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param event [String, nil]
        #   @param locale [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        #   @param override [Hash{Symbol=>Object}, nil]
      end

      class InboundBulkContentMessage < Trycourier::Internal::Type::BaseModel
        # @!attribute content
        #   Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @return [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent]
        required :content, union: -> { Trycourier::InboundBulkMessage::InboundBulkContentMessage::Content }

        # @!attribute brand
        #
        #   @return [String, nil]
        optional :brand, String, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

        # @!attribute event
        #
        #   @return [String, nil]
        optional :event, String, nil?: true

        # @!attribute locale
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :locale,
                 Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute override
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override,
                 Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
                 nil?: true

        # @!method initialize(content:, brand: nil, data: nil, event: nil, locale: nil, override: nil)
        #   @param content [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent] Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @param brand [String, nil]
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #
        #   @param event [String, nil]
        #
        #   @param locale [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        #
        #   @param override [Hash{Symbol=>Object}, nil]

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        # @see Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage#content
        module Content
          extend Trycourier::Internal::Type::Union

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          variant -> { Trycourier::ElementalContentSugar }

          variant -> { Trycourier::ElementalContent }

          # @!method self.variants
          #   @return [Array(Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent)]
        end
      end

      # @!method self.variants
      #   @return [Array(Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage)]
    end
  end
end

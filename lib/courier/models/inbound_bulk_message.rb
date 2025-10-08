# frozen_string_literal: true

module Courier
  module Models
    module InboundBulkMessage
      extend Courier::Internal::Type::Union

      variant -> { Courier::InboundBulkMessage::InboundBulkTemplateMessage }

      variant -> { Courier::InboundBulkMessage::InboundBulkContentMessage }

      class InboundBulkTemplateMessage < Courier::Internal::Type::BaseModel
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
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute event
        #
        #   @return [String, nil]
        optional :event, String, nil?: true

        # @!attribute locale
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :locale,
                 Courier::Internal::Type::HashOf[Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute override
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!method initialize(template:, brand: nil, data: nil, event: nil, locale: nil, override: nil)
        #   @param template [String]
        #   @param brand [String, nil]
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param event [String, nil]
        #   @param locale [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        #   @param override [Hash{Symbol=>Object}, nil]
      end

      class InboundBulkContentMessage < Courier::Internal::Type::BaseModel
        # @!attribute content
        #   Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @return [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent]
        required :content, union: -> { Courier::InboundBulkMessage::InboundBulkContentMessage::Content }

        # @!attribute brand
        #
        #   @return [String, nil]
        optional :brand, String, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute event
        #
        #   @return [String, nil]
        optional :event, String, nil?: true

        # @!attribute locale
        #
        #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
        optional :locale,
                 Courier::Internal::Type::HashOf[Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute override
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!method initialize(content:, brand: nil, data: nil, event: nil, locale: nil, override: nil)
        #   @param content [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent] Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
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
        # @see Courier::Models::InboundBulkMessage::InboundBulkContentMessage#content
        module Content
          extend Courier::Internal::Type::Union

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          variant -> { Courier::ElementalContentSugar }

          variant -> { Courier::ElementalContent }

          # @!method self.variants
          #   @return [Array(Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent)]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::InboundBulkContentMessage)]
    end
  end
end

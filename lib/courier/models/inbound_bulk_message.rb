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
        #   @return [Courier::Models::Content::ElementalContentSugar, Courier::Models::Tenants::ElementalContent]
        required :content, union: -> { Courier::Content }

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
        #   @param content [Courier::Models::Content::ElementalContentSugar, Courier::Models::Tenants::ElementalContent] Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
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
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Courier::Models::InboundBulkMessage::InboundBulkContentMessage)]
    end
  end
end

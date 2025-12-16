# frozen_string_literal: true

module Trycourier
  module Models
    class InboundBulkMessage < Trycourier::Internal::Type::BaseModel
      # @!attribute event
      #   Event ID or Notification ID (required). Can be either a Notification ID (e.g.,
      #   "FRH3QXM9E34W4RKP7MRC8NZ1T8V8") or a custom Event ID (e.g., "welcome-email")
      #   mapped to a notification.
      #
      #   @return [String]
      required :event, String

      # @!attribute brand
      #
      #   @return [String, nil]
      optional :brand, String, nil?: true

      # @!attribute content
      #   Elemental content (optional, for V2 format). When provided, this will be used
      #   instead of the notification associated with the `event` field.
      #
      #   @return [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent, nil]
      optional :content, union: -> { Trycourier::InboundBulkMessage::Content }, nil?: true

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute locale
      #
      #   @return [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
      optional :locale,
               Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown]],
               nil?: true

      # @!attribute override
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :override, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

      # @!attribute template
      #   Notification ID or template ID (optional, for V2 format). When provided, this
      #   will be used instead of the notification associated with the `event` field.
      #
      #   @return [String, nil]
      optional :template, String, nil?: true

      # @!method initialize(event:, brand: nil, content: nil, data: nil, locale: nil, override: nil, template: nil)
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::InboundBulkMessage} for more details.
      #
      #   Bulk message definition. Supports two formats:
      #
      #   - V1 format: Requires `event` field (event ID or notification ID)
      #   - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #     content) in addition to `event`
      #
      #   @param event [String] Event ID or Notification ID (required). Can be either a
      #
      #   @param brand [String, nil]
      #
      #   @param content [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent, nil] Elemental content (optional, for V2 format). When provided, this will be used
      #
      #   @param data [Hash{Symbol=>Object}, nil]
      #
      #   @param locale [Hash{Symbol=>Hash{Symbol=>Object}}, nil]
      #
      #   @param override [Hash{Symbol=>Object}, nil]
      #
      #   @param template [String, nil] Notification ID or template ID (optional, for V2 format). When provided,

      # Elemental content (optional, for V2 format). When provided, this will be used
      # instead of the notification associated with the `event` field.
      #
      # @see Trycourier::Models::InboundBulkMessage#content
      module Content
        extend Trycourier::Internal::Type::Union

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        variant -> { Trycourier::ElementalContentSugar }

        variant -> { Trycourier::ElementalContent }

        # @!method self.variants
        #   @return [Array(Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent)]
      end
    end
  end
end

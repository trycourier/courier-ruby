# frozen_string_literal: true

module Courier
  module Models
    class InboundBulkMessage < Courier::Internal::Type::BaseModel
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
      #   @return [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent, nil]
      optional :content, union: -> { Courier::InboundBulkMessage::Content }, nil?: true

      # @!attribute data
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

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

      # @!attribute template
      #   Notification ID or template ID (optional, for V2 format). When provided, this
      #   will be used instead of the notification associated with the `event` field.
      #
      #   @return [String, nil]
      optional :template, String, nil?: true

      # @!method initialize(event:, brand: nil, content: nil, data: nil, locale: nil, override: nil, template: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::InboundBulkMessage} for more details.
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
      #   @param content [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent, nil] Elemental content (optional, for V2 format). When provided, this will be used
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
      # @see Courier::Models::InboundBulkMessage#content
      module Content
        extend Courier::Internal::Type::Union

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        variant -> { Courier::ElementalContentSugar }

        variant -> { Courier::ElementalContent }

        # @!method self.variants
        #   @return [Array(Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent)]
      end
    end
  end
end

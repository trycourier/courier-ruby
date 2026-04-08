# frozen_string_literal: true

module Courier
  module Models
    class NotificationContentPutRequest < Courier::Internal::Type::BaseModel
      # @!attribute content
      #   Elemental content payload. The server defaults `version` when omitted.
      #
      #   @return [Courier::Models::NotificationContentPutRequest::Content]
      required :content, -> { Courier::NotificationContentPutRequest::Content }

      # @!attribute state
      #   Template state. Defaults to `DRAFT`.
      #
      #   @return [Symbol, Courier::Models::NotificationTemplateState, nil]
      optional :state, enum: -> { Courier::NotificationTemplateState }

      # @!method initialize(content:, state: nil)
      #   Request body for replacing the elemental content of a notification template.
      #
      #   @param content [Courier::Models::NotificationContentPutRequest::Content] Elemental content payload. The server defaults `version` when omitted.
      #
      #   @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.

      # @see Courier::Models::NotificationContentPutRequest#content
      class Content < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

        # @!attribute version
        #   Content version identifier (e.g., `2022-01-01`). Optional; server defaults when
        #   omitted.
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(elements:, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::NotificationContentPutRequest::Content} for more details.
        #
        #   Elemental content payload. The server defaults `version` when omitted.
        #
        #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
        #
        #   @param version [String] Content version identifier (e.g., `2022-01-01`). Optional; server defaults when
      end
    end
  end
end

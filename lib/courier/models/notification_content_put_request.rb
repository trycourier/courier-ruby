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

        # @!attribute scope
        #   How template variables read the data sent with the message. Under `strict`, data
        #   fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
        #   `default`, `data` is spread onto the root, so `{{name}}` resolves and
        #   `{{data.name}}` renders as an empty string. This request replaces the stored
        #   content, so omitting `scope` resets it to `default`.
        #
        #   @return [Symbol, Courier::Models::NotificationContentPutRequest::Content::Scope, nil]
        optional :scope, enum: -> { Courier::NotificationContentPutRequest::Content::Scope }

        # @!attribute version
        #   Content version identifier (e.g., `2022-01-01`). Optional; server defaults when
        #   omitted.
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(elements:, scope: nil, version: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::NotificationContentPutRequest::Content} for more details.
        #
        #   Elemental content payload. The server defaults `version` when omitted.
        #
        #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
        #
        #   @param scope [Symbol, Courier::Models::NotificationContentPutRequest::Content::Scope] How template variables read the data sent with the message. Under `strict`, data
        #
        #   @param version [String] Content version identifier (e.g., `2022-01-01`). Optional; server defaults when

        # How template variables read the data sent with the message. Under `strict`, data
        # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
        # `default`, `data` is spread onto the root, so `{{name}}` resolves and
        # `{{data.name}}` renders as an empty string. This request replaces the stored
        # content, so omitting `scope` resets it to `default`.
        #
        # @see Courier::Models::NotificationContentPutRequest::Content#scope
        module Scope
          extend Courier::Internal::Type::Enum

          DEFAULT = :default
          STRICT = :strict

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    class ElementalContent < Courier::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
      required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

      # @!attribute version
      #   For example, "2022-01-01"
      #
      #   @return [String]
      required :version, String

      # @!attribute scope
      #   How template variables read the data sent with the message. Under `strict`, data
      #   fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
      #   `default`, `data` is spread onto the root, so `{{name}}` resolves and
      #   `{{data.name}}` renders as an empty string. Templates saved in Design Studio are
      #   `strict`. When omitted, the content is `default`. A write that replaces a
      #   template's content resets it to `default` unless the request sends `scope`
      #   again.
      #
      #   @return [Symbol, Courier::Models::ElementalContent::Scope, nil]
      optional :scope, enum: -> { Courier::ElementalContent::Scope }

      # @!method initialize(elements:, version:, scope: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalContent} for more details.
      #
      #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType>]
      #
      #   @param version [String] For example, "2022-01-01"
      #
      #   @param scope [Symbol, Courier::Models::ElementalContent::Scope] How template variables read the data sent with the message. Under `strict`, data

      # How template variables read the data sent with the message. Under `strict`, data
      # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
      # `default`, `data` is spread onto the root, so `{{name}}` resolves and
      # `{{data.name}}` renders as an empty string. Templates saved in Design Studio are
      # `strict`. When omitted, the content is `default`. A write that replaces a
      # template's content resets it to `default` unless the request sends `scope`
      # again.
      #
      # @see Courier::Models::ElementalContent#scope
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

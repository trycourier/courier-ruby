# typed: strong

module Courier
  module Models
    class ElementalContent < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalContent, Courier::Internal::AnyHash)
        end

      sig do
        returns(
          T::Array[
            T.any(
              Courier::ElementalTextNodeWithType,
              Courier::ElementalMetaNodeWithType,
              Courier::ElementalChannelNodeWithType,
              Courier::ElementalImageNodeWithType,
              Courier::ElementalActionNodeWithType,
              Courier::ElementalDividerNodeWithType,
              Courier::ElementalQuoteNodeWithType,
              Courier::ElementalHTMLNodeWithType
            )
          ]
        )
      end
      attr_accessor :elements

      # For example, "2022-01-01"
      sig { returns(String) }
      attr_accessor :version

      # How template variables read the data sent with the message. Under `strict`, data
      # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
      # `default`, `data` is spread onto the root, so `{{name}}` resolves and
      # `{{data.name}}` renders as an empty string. Templates saved in Design Studio are
      # `strict`. When omitted, the content is `default`. A write that replaces a
      # template's content resets it to `default` unless the request sends `scope`
      # again.
      sig { returns(T.nilable(Courier::ElementalContent::Scope::OrSymbol)) }
      attr_reader :scope

      sig { params(scope: Courier::ElementalContent::Scope::OrSymbol).void }
      attr_writer :scope

      sig do
        params(
          elements:
            T::Array[
              T.any(
                Courier::ElementalTextNodeWithType::OrHash,
                Courier::ElementalMetaNodeWithType::OrHash,
                Courier::ElementalChannelNodeWithType::OrHash,
                Courier::ElementalImageNodeWithType::OrHash,
                Courier::ElementalActionNodeWithType::OrHash,
                Courier::ElementalDividerNodeWithType::OrHash,
                Courier::ElementalQuoteNodeWithType::OrHash,
                Courier::ElementalHTMLNodeWithType::OrHash
              )
            ],
          version: String,
          scope: Courier::ElementalContent::Scope::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        elements:,
        # For example, "2022-01-01"
        version:,
        # How template variables read the data sent with the message. Under `strict`, data
        # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
        # `default`, `data` is spread onto the root, so `{{name}}` resolves and
        # `{{data.name}}` renders as an empty string. Templates saved in Design Studio are
        # `strict`. When omitted, the content is `default`. A write that replaces a
        # template's content resets it to `default` unless the request sends `scope`
        # again.
        scope: nil
      )
      end

      sig do
        override.returns(
          {
            elements:
              T::Array[
                T.any(
                  Courier::ElementalTextNodeWithType,
                  Courier::ElementalMetaNodeWithType,
                  Courier::ElementalChannelNodeWithType,
                  Courier::ElementalImageNodeWithType,
                  Courier::ElementalActionNodeWithType,
                  Courier::ElementalDividerNodeWithType,
                  Courier::ElementalQuoteNodeWithType,
                  Courier::ElementalHTMLNodeWithType
                )
              ],
            version: String,
            scope: Courier::ElementalContent::Scope::OrSymbol
          }
        )
      end
      def to_hash
      end

      # How template variables read the data sent with the message. Under `strict`, data
      # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
      # `default`, `data` is spread onto the root, so `{{name}}` resolves and
      # `{{data.name}}` renders as an empty string. Templates saved in Design Studio are
      # `strict`. When omitted, the content is `default`. A write that replaces a
      # template's content resets it to `default` unless the request sends `scope`
      # again.
      module Scope
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::ElementalContent::Scope) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DEFAULT =
          T.let(:default, Courier::ElementalContent::Scope::TaggedSymbol)
        STRICT = T.let(:strict, Courier::ElementalContent::Scope::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalContent::Scope::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

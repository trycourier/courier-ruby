# typed: strong

module Courier
  module Models
    class NotificationContentPutRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationContentPutRequest,
            Courier::Internal::AnyHash
          )
        end

      # Elemental content payload. The server defaults `version` when omitted.
      sig { returns(Courier::NotificationContentPutRequest::Content) }
      attr_reader :content

      sig do
        params(
          content: Courier::NotificationContentPutRequest::Content::OrHash
        ).void
      end
      attr_writer :content

      # Template state. Defaults to `DRAFT`.
      sig { returns(T.nilable(Courier::NotificationTemplateState::OrSymbol)) }
      attr_reader :state

      sig { params(state: Courier::NotificationTemplateState::OrSymbol).void }
      attr_writer :state

      # Request body for replacing the elemental content of a notification template.
      sig do
        params(
          content: Courier::NotificationContentPutRequest::Content::OrHash,
          state: Courier::NotificationTemplateState::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Elemental content payload. The server defaults `version` when omitted.
        content:,
        # Template state. Defaults to `DRAFT`.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            content: Courier::NotificationContentPutRequest::Content,
            state: Courier::NotificationTemplateState::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Content < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationContentPutRequest::Content,
              Courier::Internal::AnyHash
            )
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

        # How template variables read the data sent with the message. Under `strict`, data
        # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
        # `default`, `data` is spread onto the root, so `{{name}}` resolves and
        # `{{data.name}}` renders as an empty string. This request replaces the stored
        # content, so omitting `scope` resets it to `default`.
        sig do
          returns(
            T.nilable(
              Courier::NotificationContentPutRequest::Content::Scope::OrSymbol
            )
          )
        end
        attr_reader :scope

        sig do
          params(
            scope:
              Courier::NotificationContentPutRequest::Content::Scope::OrSymbol
          ).void
        end
        attr_writer :scope

        # Content version identifier (e.g., `2022-01-01`). Optional; server defaults when
        # omitted.
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Elemental content payload. The server defaults `version` when omitted.
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
            scope:
              Courier::NotificationContentPutRequest::Content::Scope::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          elements:,
          # How template variables read the data sent with the message. Under `strict`, data
          # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
          # `default`, `data` is spread onto the root, so `{{name}}` resolves and
          # `{{data.name}}` renders as an empty string. This request replaces the stored
          # content, so omitting `scope` resets it to `default`.
          scope: nil,
          # Content version identifier (e.g., `2022-01-01`). Optional; server defaults when
          # omitted.
          version: nil
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
              scope:
                Courier::NotificationContentPutRequest::Content::Scope::OrSymbol,
              version: String
            }
          )
        end
        def to_hash
        end

        # How template variables read the data sent with the message. Under `strict`, data
        # fields are read only through the `data.` prefix, as in `{{data.name}}`. Under
        # `default`, `data` is spread onto the root, so `{{name}}` resolves and
        # `{{data.name}}` renders as an empty string. This request replaces the stored
        # content, so omitting `scope` resets it to `default`.
        module Scope
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::NotificationContentPutRequest::Content::Scope
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEFAULT =
            T.let(
              :default,
              Courier::NotificationContentPutRequest::Content::Scope::TaggedSymbol
            )
          STRICT =
            T.let(
              :strict,
              Courier::NotificationContentPutRequest::Content::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::NotificationContentPutRequest::Content::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

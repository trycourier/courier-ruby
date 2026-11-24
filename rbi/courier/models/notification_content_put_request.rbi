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
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          elements:,
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
              version: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

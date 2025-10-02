# typed: strong

module Courier
  module Models
    class InboundBulkMessage < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::InboundBulkMessage, Courier::Internal::AnyHash)
        end

      # A unique identifier that represents the brand that should be used for rendering
      # the notification.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand

      # JSON that includes any data you want to pass to a message template. The data
      # will populate the corresponding template variables.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      sig { returns(T.nilable(String)) }
      attr_accessor :event

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :locale

      # Describes the content of the message in a way that will work for email, push,
      # chat, or any channel.
      sig do
        returns(
          T.nilable(
            T.any(
              Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage,
              Courier::InboundBulkMessage::Message::InboundBulkContentMessage
            )
          )
        )
      end
      attr_accessor :message

      # JSON that is merged into the request sent by Courier to the provider to override
      # properties or to gain access to features in the provider API that are not
      # natively supported by Courier.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :override

      sig { params(override: T.anything).void }
      attr_writer :override

      sig do
        params(
          brand: T.nilable(String),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          event: T.nilable(String),
          locale: T.nilable(T::Hash[Symbol, T.anything]),
          message:
            T.nilable(
              T.any(
                Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage::OrHash,
                Courier::InboundBulkMessage::Message::InboundBulkContentMessage::OrHash
              )
            ),
          override: T.anything
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier that represents the brand that should be used for rendering
        # the notification.
        brand: nil,
        # JSON that includes any data you want to pass to a message template. The data
        # will populate the corresponding template variables.
        data: nil,
        event: nil,
        locale: nil,
        # Describes the content of the message in a way that will work for email, push,
        # chat, or any channel.
        message: nil,
        # JSON that is merged into the request sent by Courier to the provider to override
        # properties or to gain access to features in the provider API that are not
        # natively supported by Courier.
        override: nil
      )
      end

      sig do
        override.returns(
          {
            brand: T.nilable(String),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            event: T.nilable(String),
            locale: T.nilable(T::Hash[Symbol, T.anything]),
            message:
              T.nilable(
                T.any(
                  Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage,
                  Courier::InboundBulkMessage::Message::InboundBulkContentMessage
                )
              ),
            override: T.anything
          }
        )
      end
      def to_hash
      end

      # Describes the content of the message in a way that will work for email, push,
      # chat, or any channel.
      module Message
        extend Courier::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage,
              Courier::InboundBulkMessage::Message::InboundBulkContentMessage
            )
          end

        class InboundBulkTemplateMessage < Courier::Models::BaseMessage
          OrHash =
            T.type_alias do
              T.any(
                Courier::InboundBulkMessage::Message::InboundBulkTemplateMessage,
                Courier::Internal::AnyHash
              )
            end

          # The id of the notification template to be rendered and sent to the recipient(s).
          # This field or the content field must be supplied.
          sig { returns(String) }
          attr_accessor :template

          # Describes the content of the message in a way that will work for email, push,
          # chat, or any channel.
          sig { params(template: String).returns(T.attached_class) }
          def self.new(
            # The id of the notification template to be rendered and sent to the recipient(s).
            # This field or the content field must be supplied.
            template:
          )
          end

          sig { override.returns({ template: String }) }
          def to_hash
          end
        end

        class InboundBulkContentMessage < Courier::Models::BaseMessage
          OrHash =
            T.type_alias do
              T.any(
                Courier::InboundBulkMessage::Message::InboundBulkContentMessage,
                Courier::Internal::AnyHash
              )
            end

          # Describes the content of the message in a way that will work for email, push,
          # chat, or any channel. Either this or template must be specified.
          sig do
            returns(
              T.any(
                Courier::Tenants::ElementalContent,
                Courier::Content::ElementalContentSugar
              )
            )
          end
          attr_accessor :content

          # A template for a type of message that can be sent more than once. For example,
          # you might create an "Appointment Reminder" Notification or “Reset Password”
          # Notifications.
          sig do
            params(
              content:
                T.any(
                  Courier::Tenants::ElementalContent::OrHash,
                  Courier::Content::ElementalContentSugar::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Describes the content of the message in a way that will work for email, push,
            # chat, or any channel. Either this or template must be specified.
            content:
          )
          end

          sig do
            override.returns(
              {
                content:
                  T.any(
                    Courier::Tenants::ElementalContent,
                    Courier::Content::ElementalContentSugar
                  )
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Courier::InboundBulkMessage::Message::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end

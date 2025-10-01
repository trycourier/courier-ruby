# typed: strong

module Courier
  module Models
    class SendSendMessageParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::SendSendMessageParams, Courier::Internal::AnyHash)
        end

      # Defines the message to be delivered
      sig do
        returns(
          T.any(
            Courier::Message::ContentMessage,
            Courier::Message::TemplateMessage
          )
        )
      end
      attr_accessor :message

      sig do
        params(
          message:
            T.any(
              Courier::Message::ContentMessage::OrHash,
              Courier::Message::TemplateMessage::OrHash
            ),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Defines the message to be delivered
        message:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            message:
              T.any(
                Courier::Message::ContentMessage,
                Courier::Message::TemplateMessage
              ),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Trycourier
  module Models
    class BulkCreateJobParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::BulkCreateJobParams, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Trycourier::InboundBulkMessage::InboundBulkTemplateMessage,
            Trycourier::InboundBulkMessage::InboundBulkContentMessage
          )
        )
      end
      attr_accessor :message

      sig do
        params(
          message:
            T.any(
              Trycourier::InboundBulkMessage::InboundBulkTemplateMessage::OrHash,
              Trycourier::InboundBulkMessage::InboundBulkContentMessage::OrHash
            ),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(message:, request_options: {})
      end

      sig do
        override.returns(
          {
            message:
              T.any(
                Trycourier::InboundBulkMessage::InboundBulkTemplateMessage,
                Trycourier::InboundBulkMessage::InboundBulkContentMessage
              ),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

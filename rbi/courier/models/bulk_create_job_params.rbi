# typed: strong

module Courier
  module Models
    class BulkCreateJobParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BulkCreateJobParams, Courier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Courier::InboundBulkMessage::InboundBulkTemplateMessage,
            Courier::InboundBulkMessage::InboundBulkContentMessage
          )
        )
      end
      attr_accessor :message

      sig do
        params(
          message:
            T.any(
              Courier::InboundBulkMessage::InboundBulkTemplateMessage::OrHash,
              Courier::InboundBulkMessage::InboundBulkContentMessage::OrHash
            ),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(message:, request_options: {})
      end

      sig do
        override.returns(
          {
            message:
              T.any(
                Courier::InboundBulkMessage::InboundBulkTemplateMessage,
                Courier::InboundBulkMessage::InboundBulkContentMessage
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

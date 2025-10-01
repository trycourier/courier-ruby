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

      sig { returns(Courier::InboundBulkMessage) }
      attr_reader :message

      sig { params(message: Courier::InboundBulkMessage::OrHash).void }
      attr_writer :message

      sig do
        params(
          message: Courier::InboundBulkMessage::OrHash,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(message:, request_options: {})
      end

      sig do
        override.returns(
          {
            message: Courier::InboundBulkMessage,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

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

      # Bulk message definition. Supports two formats:
      #
      # - V1 format: Requires `event` field (event ID or notification ID)
      # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #   content) in addition to `event`
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
      def self.new(
        # Bulk message definition. Supports two formats:
        #
        # - V1 format: Requires `event` field (event ID or notification ID)
        # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
        #   content) in addition to `event`
        message:,
        request_options: {}
      )
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

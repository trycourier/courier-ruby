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

      # Bulk message definition. Supports two formats:
      #
      # - V1 format: Requires `event` field (event ID or notification ID)
      # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
      #   content) in addition to `event`
      sig { returns(Trycourier::InboundBulkMessage) }
      attr_reader :message

      sig { params(message: Trycourier::InboundBulkMessage::OrHash).void }
      attr_writer :message

      sig do
        params(
          message: Trycourier::InboundBulkMessage::OrHash,
          request_options: Trycourier::RequestOptions::OrHash
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
            message: Trycourier::InboundBulkMessage,
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

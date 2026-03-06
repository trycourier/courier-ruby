# typed: strong

module Courier
  module Models
    class MessageCancelParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::MessageCancelParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :message_id

      sig do
        params(
          message_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(message_id:, request_options: {})
      end

      sig do
        override.returns(
          { message_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

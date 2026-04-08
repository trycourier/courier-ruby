# typed: strong

module Courier
  module Models
    class NotificationPutElementParams < Courier::Models::NotificationElementPutRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationPutElementParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :element_id

      sig do
        params(
          id: String,
          element_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, element_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
            element_id: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

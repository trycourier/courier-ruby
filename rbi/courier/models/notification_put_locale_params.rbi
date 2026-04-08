# typed: strong

module Courier
  module Models
    class NotificationPutLocaleParams < Courier::Models::NotificationLocalePutRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationPutLocaleParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :locale_id

      sig do
        params(
          id: String,
          locale_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, locale_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            id: String,
            locale_id: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class PreviewRetrieveDeviceSetParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::PreviewRetrieveDeviceSetParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :device_set_id

      sig do
        params(
          device_set_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(device_set_id:, request_options: {})
      end

      sig do
        override.returns(
          { device_set_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

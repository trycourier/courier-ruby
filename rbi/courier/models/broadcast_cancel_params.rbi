# typed: strong

module Courier
  module Models
    class BroadcastCancelParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::BroadcastCancelParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      sig do
        params(
          broadcast_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(broadcast_id:, request_options: {})
      end

      sig do
        override.returns(
          { broadcast_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

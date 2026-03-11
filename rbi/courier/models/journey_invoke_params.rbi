# typed: strong

module Courier
  module Models
    class JourneyInvokeParams < Courier::Models::JourneysInvokeRequest
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::JourneyInvokeParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :template_id

      sig do
        params(
          template_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(template_id:, request_options: {})
      end

      sig do
        override.returns(
          { template_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

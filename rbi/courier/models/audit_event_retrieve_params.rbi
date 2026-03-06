# typed: strong

module Courier
  module Models
    class AuditEventRetrieveParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AuditEventRetrieveParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :audit_event_id

      sig do
        params(
          audit_event_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(audit_event_id:, request_options: {})
      end

      sig do
        override.returns(
          { audit_event_id: String, request_options: Courier::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end

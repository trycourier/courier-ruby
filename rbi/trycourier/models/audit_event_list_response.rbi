# typed: strong

module Trycourier
  module Models
    class AuditEventListResponse < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::Models::AuditEventListResponse,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(Trycourier::Paging) }
      attr_reader :paging

      sig { params(paging: Trycourier::Paging::OrHash).void }
      attr_writer :paging

      sig { returns(T::Array[Trycourier::AuditEvent]) }
      attr_accessor :results

      sig do
        params(
          paging: Trycourier::Paging::OrHash,
          results: T::Array[Trycourier::AuditEvent::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          {
            paging: Trycourier::Paging,
            results: T::Array[Trycourier::AuditEvent]
          }
        )
      end
      def to_hash
      end
    end
  end
end

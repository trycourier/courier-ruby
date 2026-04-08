# typed: strong

module Courier
  module Models
    class AssociatedNotificationListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::AssociatedNotificationListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig { returns(T::Array[Courier::NotificationTemplateSummary]) }
      attr_accessor :results

      # Paginated list of notification templates associated with a routing strategy.
      sig do
        params(
          paging: Courier::Paging::OrHash,
          results: T::Array[Courier::NotificationTemplateSummary::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          {
            paging: Courier::Paging,
            results: T::Array[Courier::NotificationTemplateSummary]
          }
        )
      end
      def to_hash
      end
    end
  end
end

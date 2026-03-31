# typed: strong

module Courier
  module Models
    class RoutingStrategyListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::RoutingStrategyListResponse,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(Courier::Paging) }
      attr_reader :paging

      sig { params(paging: Courier::Paging::OrHash).void }
      attr_writer :paging

      sig { returns(T::Array[Courier::RoutingStrategySummary]) }
      attr_accessor :results

      # Paginated list of routing strategy summaries.
      sig do
        params(
          paging: Courier::Paging::OrHash,
          results: T::Array[Courier::RoutingStrategySummary::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(paging:, results:)
      end

      sig do
        override.returns(
          {
            paging: Courier::Paging,
            results: T::Array[Courier::RoutingStrategySummary]
          }
        )
      end
      def to_hash
      end
    end
  end
end

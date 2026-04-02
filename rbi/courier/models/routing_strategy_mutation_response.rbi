# typed: strong

module Courier
  module Models
    class RoutingStrategyMutationResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::RoutingStrategyMutationResponse,
            Courier::Internal::AnyHash
          )
        end

      # The routing strategy ID (rs\_ prefix).
      sig { returns(String) }
      attr_accessor :id

      # Response returned by create and replace operations.
      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # The routing strategy ID (rs\_ prefix).
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end

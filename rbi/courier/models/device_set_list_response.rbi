# typed: strong

module Courier
  module Models
    class DeviceSetListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::DeviceSetListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::DeviceSet]) }
      attr_accessor :results

      # The workspace's active device sets. Not paginated.
      sig do
        params(results: T::Array[Courier::DeviceSet::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(results:)
      end

      sig { override.returns({ results: T::Array[Courier::DeviceSet] }) }
      def to_hash
      end
    end
  end
end

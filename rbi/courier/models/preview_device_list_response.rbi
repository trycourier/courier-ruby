# typed: strong

module Courier
  module Models
    class PreviewDeviceListResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PreviewDeviceListResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::PreviewDevice]) }
      attr_accessor :results

      # The full catalog of renderable devices. Not paginated.
      sig do
        params(results: T::Array[Courier::PreviewDevice::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(results:)
      end

      sig { override.returns({ results: T::Array[Courier::PreviewDevice] }) }
      def to_hash
      end
    end
  end
end

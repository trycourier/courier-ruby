# typed: strong

module Courier
  module Models
    class AirshipProfile < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AirshipProfile, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::AirshipProfileAudience) }
      attr_reader :audience

      sig { params(audience: Courier::AirshipProfileAudience::OrHash).void }
      attr_writer :audience

      sig { returns(T::Array[String]) }
      attr_accessor :device_types

      sig do
        params(
          audience: Courier::AirshipProfileAudience::OrHash,
          device_types: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(audience:, device_types:)
      end

      sig do
        override.returns(
          {
            audience: Courier::AirshipProfileAudience,
            device_types: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end

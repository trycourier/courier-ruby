# typed: strong

module Trycourier
  module Models
    class AirshipProfile < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::AirshipProfile, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::AirshipProfileAudience) }
      attr_reader :audience

      sig { params(audience: Trycourier::AirshipProfileAudience::OrHash).void }
      attr_writer :audience

      sig { returns(T::Array[String]) }
      attr_accessor :device_types

      sig do
        params(
          audience: Trycourier::AirshipProfileAudience::OrHash,
          device_types: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(audience:, device_types:)
      end

      sig do
        override.returns(
          {
            audience: Trycourier::AirshipProfileAudience,
            device_types: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end

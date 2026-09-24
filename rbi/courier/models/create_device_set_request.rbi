# typed: strong

module Courier
  module Models
    class CreateDeviceSetRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::CreateDeviceSetRequest, Courier::Internal::AnyHash)
        end

      # The devices the set contains, by `PreviewDevice.id`. At least one is required.
      sig { returns(T::Array[String]) }
      attr_accessor :device_ids

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Request body for creating or replacing a device set. A full replace, not a patch
      # — both fields are always written.
      sig do
        params(device_ids: T::Array[String], name: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # The devices the set contains, by `PreviewDevice.id`. At least one is required.
        device_ids:,
        # Human-readable name.
        name:
      )
      end

      sig { override.returns({ device_ids: T::Array[String], name: String }) }
      def to_hash
      end
    end
  end
end

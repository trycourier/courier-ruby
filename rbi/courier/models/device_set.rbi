# typed: strong

module Courier
  module Models
    class DeviceSet < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::DeviceSet, Courier::Internal::AnyHash) }

      # Unique identifier for the device set.
      sig { returns(String) }
      attr_accessor :id

      # ISO-8601 timestamp of when the set was created.
      sig { returns(String) }
      attr_accessor :created_at

      # The devices in this set, by `PreviewDevice.id`.
      sig { returns(T::Array[String]) }
      attr_accessor :device_ids

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # ISO-8601 timestamp of when the set was last written.
      sig { returns(String) }
      attr_accessor :updated_at

      # ISO-8601 timestamp of when the set was archived. Present only on the archive
      # response, which is the one place the state is observable.
      sig { returns(T.nilable(String)) }
      attr_reader :archived_at

      sig { params(archived_at: String).void }
      attr_writer :archived_at

      # A named, reusable list of preview devices.
      sig do
        params(
          id: String,
          created_at: String,
          device_ids: T::Array[String],
          name: String,
          updated_at: String,
          archived_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the device set.
        id:,
        # ISO-8601 timestamp of when the set was created.
        created_at:,
        # The devices in this set, by `PreviewDevice.id`.
        device_ids:,
        # Human-readable name.
        name:,
        # ISO-8601 timestamp of when the set was last written.
        updated_at:,
        # ISO-8601 timestamp of when the set was archived. Present only on the archive
        # response, which is the one place the state is observable.
        archived_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            device_ids: T::Array[String],
            name: String,
            updated_at: String,
            archived_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

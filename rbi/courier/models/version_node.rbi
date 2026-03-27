# typed: strong

module Courier
  module Models
    class VersionNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::VersionNode, Courier::Internal::AnyHash) }

      # Epoch milliseconds when this version was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the version creator.
      sig { returns(String) }
      attr_accessor :creator

      # Version identifier. One of "draft", "published:vNNN" (current published
      # version), or "vNNN" (historical version).
      sig { returns(String) }
      attr_accessor :version

      # Whether the draft has unpublished changes. Only present on the draft version.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_changes

      sig { params(has_changes: T::Boolean).void }
      attr_writer :has_changes

      # A version entry for a notification template.
      sig do
        params(
          created: Integer,
          creator: String,
          version: String,
          has_changes: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Epoch milliseconds when this version was created.
        created:,
        # User ID of the version creator.
        creator:,
        # Version identifier. One of "draft", "published:vNNN" (current published
        # version), or "vNNN" (historical version).
        version:,
        # Whether the draft has unpublished changes. Only present on the draft version.
        has_changes: nil
      )
      end

      sig do
        override.returns(
          {
            created: Integer,
            creator: String,
            version: String,
            has_changes: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end

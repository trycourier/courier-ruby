# typed: strong

module Courier
  module Models
    class DigestInstance < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::DigestInstance, Courier::Internal::AnyHash)
        end

      # A unique identifier for the digest instance.
      sig { returns(String) }
      attr_accessor :digest_instance_id

      # The total number of events received for this instance.
      sig { returns(Integer) }
      attr_accessor :event_count

      # The status of the digest instance. `IN_PROGRESS` instances are still
      # accumulating events; `COMPLETED` instances have been released.
      sig { returns(Courier::DigestInstance::Status::TaggedSymbol) }
      attr_accessor :status

      # The ID of the user this digest instance belongs to.
      sig { returns(String) }
      attr_accessor :user_id

      # The categories configured for the digest.
      sig { returns(T.nilable(T::Array[Courier::DigestCategory])) }
      attr_reader :categories

      sig { params(categories: T::Array[Courier::DigestCategory::OrHash]).void }
      attr_writer :categories

      # A map of category key to the number of events received for that category.
      sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
      attr_reader :category_key_counts

      sig { params(category_key_counts: T::Hash[Symbol, Integer]).void }
      attr_writer :category_key_counts

      # An ISO 8601 timestamp of when the digest instance was created.
      sig { returns(T.nilable(String)) }
      attr_reader :created_at

      sig { params(created_at: String).void }
      attr_writer :created_at

      # Whether the digest instance has been disabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disabled

      sig { params(disabled: T::Boolean).void }
      attr_writer :disabled

      # The ID of the tenant this digest instance belongs to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :tenant_id

      sig do
        params(
          digest_instance_id: String,
          event_count: Integer,
          status: Courier::DigestInstance::Status::OrSymbol,
          user_id: String,
          categories: T::Array[Courier::DigestCategory::OrHash],
          category_key_counts: T::Hash[Symbol, Integer],
          created_at: String,
          disabled: T::Boolean,
          tenant_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier for the digest instance.
        digest_instance_id:,
        # The total number of events received for this instance.
        event_count:,
        # The status of the digest instance. `IN_PROGRESS` instances are still
        # accumulating events; `COMPLETED` instances have been released.
        status:,
        # The ID of the user this digest instance belongs to.
        user_id:,
        # The categories configured for the digest.
        categories: nil,
        # A map of category key to the number of events received for that category.
        category_key_counts: nil,
        # An ISO 8601 timestamp of when the digest instance was created.
        created_at: nil,
        # Whether the digest instance has been disabled.
        disabled: nil,
        # The ID of the tenant this digest instance belongs to, if any.
        tenant_id: nil
      )
      end

      sig do
        override.returns(
          {
            digest_instance_id: String,
            event_count: Integer,
            status: Courier::DigestInstance::Status::TaggedSymbol,
            user_id: String,
            categories: T::Array[Courier::DigestCategory],
            category_key_counts: T::Hash[Symbol, Integer],
            created_at: String,
            disabled: T::Boolean,
            tenant_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # The status of the digest instance. `IN_PROGRESS` instances are still
      # accumulating events; `COMPLETED` instances have been released.
      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::DigestInstance::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IN_PROGRESS =
          T.let(:IN_PROGRESS, Courier::DigestInstance::Status::TaggedSymbol)
        COMPLETED =
          T.let(:COMPLETED, Courier::DigestInstance::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::DigestInstance::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

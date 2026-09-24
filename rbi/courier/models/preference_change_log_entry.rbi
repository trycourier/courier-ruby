# typed: strong

module Courier
  module Models
    class PreferenceChangeLogEntry < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PreferenceChangeLogEntry, Courier::Internal::AnyHash)
        end

      # Unique identifier for this change.
      sig { returns(String) }
      attr_accessor :id

      # The channels chosen for this topic, present only when has_custom_routing is
      # true. Empty otherwise.
      sig { returns(T::Array[Courier::ChannelClassification::TaggedSymbol]) }
      attr_accessor :custom_routing

      # Whether specific delivery channels were chosen for this topic rather than the
      # topic's default routing.
      sig { returns(T::Boolean) }
      attr_accessor :has_custom_routing

      # The subscription status the change set.
      sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
      attr_accessor :status

      # When the change was made, as an ISO-8601 date-time in UTC.
      sig { returns(String) }
      attr_accessor :timestamp

      # The subscription topic the change applies to.
      sig { returns(String) }
      attr_accessor :topic_id

      # The display name of that topic when the change was made.
      sig { returns(String) }
      attr_accessor :topic_name

      # The user whose preference changed.
      sig { returns(String) }
      attr_accessor :user_id

      # The value before this change, where it was recorded.
      sig { returns(T.nilable(Courier::PreferenceChangeLogValue)) }
      attr_reader :previous

      sig { params(previous: Courier::PreferenceChangeLogValue::OrHash).void }
      attr_writer :previous

      # The tenant context the change was made in. Absent when the user set the
      # preference outside any tenant.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      sig do
        params(
          id: String,
          custom_routing: T::Array[Courier::ChannelClassification::OrSymbol],
          has_custom_routing: T::Boolean,
          status: Courier::PreferenceStatus::OrSymbol,
          timestamp: String,
          topic_id: String,
          topic_name: String,
          user_id: String,
          previous: Courier::PreferenceChangeLogValue::OrHash,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for this change.
        id:,
        # The channels chosen for this topic, present only when has_custom_routing is
        # true. Empty otherwise.
        custom_routing:,
        # Whether specific delivery channels were chosen for this topic rather than the
        # topic's default routing.
        has_custom_routing:,
        # The subscription status the change set.
        status:,
        # When the change was made, as an ISO-8601 date-time in UTC.
        timestamp:,
        # The subscription topic the change applies to.
        topic_id:,
        # The display name of that topic when the change was made.
        topic_name:,
        # The user whose preference changed.
        user_id:,
        # The value before this change, where it was recorded.
        previous: nil,
        # The tenant context the change was made in. Absent when the user set the
        # preference outside any tenant.
        tenant_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            custom_routing:
              T::Array[Courier::ChannelClassification::TaggedSymbol],
            has_custom_routing: T::Boolean,
            status: Courier::PreferenceStatus::TaggedSymbol,
            timestamp: String,
            topic_id: String,
            topic_name: String,
            user_id: String,
            previous: Courier::PreferenceChangeLogValue,
            tenant_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

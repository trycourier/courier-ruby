# typed: strong

module Courier
  module Models
    class TopicDigestResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestResponse, Courier::Internal::AnyHash)
        end

      # Retention rules per category key.
      sig { returns(T::Array[Courier::TopicDigestCategory]) }
      attr_accessor :categories

      # The digest's delivery cadences, each with its server-assigned `schedule_id`.
      sig { returns(T::Array[Courier::TopicDigestScheduleResponse]) }
      attr_accessor :schedules

      # The notification template that renders the digest.
      sig { returns(String) }
      attr_accessor :template_id

      # The audience the digest is scoped to, when set.
      sig { returns(T.nilable(String)) }
      attr_reader :audience_id

      sig { params(audience_id: String).void }
      attr_writer :audience_id

      # ISO-8601 timestamp of when the digest was configured.
      sig { returns(T.nilable(String)) }
      attr_reader :created

      sig { params(created: String).void }
      attr_writer :created

      # Whether the digest is delivered even when nothing was collected.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :trigger_empty

      sig { params(trigger_empty: T::Boolean).void }
      attr_writer :trigger_empty

      # ISO-8601 timestamp of the last update.
      sig { returns(T.nilable(String)) }
      attr_reader :updated

      sig { params(updated: String).void }
      attr_writer :updated

      # A topic's digest configuration.
      sig do
        params(
          categories: T::Array[Courier::TopicDigestCategory::OrHash],
          schedules: T::Array[Courier::TopicDigestScheduleResponse::OrHash],
          template_id: String,
          audience_id: String,
          created: String,
          trigger_empty: T::Boolean,
          updated: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Retention rules per category key.
        categories:,
        # The digest's delivery cadences, each with its server-assigned `schedule_id`.
        schedules:,
        # The notification template that renders the digest.
        template_id:,
        # The audience the digest is scoped to, when set.
        audience_id: nil,
        # ISO-8601 timestamp of when the digest was configured.
        created: nil,
        # Whether the digest is delivered even when nothing was collected.
        trigger_empty: nil,
        # ISO-8601 timestamp of the last update.
        updated: nil
      )
      end

      sig do
        override.returns(
          {
            categories: T::Array[Courier::TopicDigestCategory],
            schedules: T::Array[Courier::TopicDigestScheduleResponse],
            template_id: String,
            audience_id: String,
            created: String,
            trigger_empty: T::Boolean,
            updated: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

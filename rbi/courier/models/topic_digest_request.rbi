# typed: strong

module Courier
  module Models
    class TopicDigestRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestRequest, Courier::Internal::AnyHash)
        end

      # The cadences this digest delivers on. At least one is required: a digest with no
      # schedule collects events into an instance that can never fire. Omitting the key
      # on a replace leaves stored schedules untouched; sending `[]` is a `400`.
      sig { returns(T::Array[Courier::TopicDigestScheduleRequest]) }
      attr_accessor :schedules

      # The notification template that renders the digest. A digest with no template
      # collects nothing, so this is required.
      sig { returns(String) }
      attr_accessor :template_id

      # Optional audience the digest is scoped to.
      sig { returns(T.nilable(String)) }
      attr_reader :audience_id

      sig { params(audience_id: String).void }
      attr_writer :audience_id

      # Retention rules per category key. Defaults to a single `digest` category
      # retaining `FIRST`.
      sig { returns(T.nilable(T::Array[Courier::TopicDigestCategory])) }
      attr_reader :categories

      sig do
        params(categories: T::Array[Courier::TopicDigestCategory::OrHash]).void
      end
      attr_writer :categories

      # Whether to deliver the digest even when nothing was collected.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :trigger_empty

      sig { params(trigger_empty: T::Boolean).void }
      attr_writer :trigger_empty

      # A topic's digest configuration: the template that renders it, the cadences it
      # delivers on, and how collected events are retained.
      #
      # Send `null` for the whole object to turn a digest off, which unlinks the
      # template and removes its schedules. There is no `enabled` flag, and
      # `schedules: []` is rejected, because both states are un-deliverable rather than
      # merely off.
      sig do
        params(
          schedules: T::Array[Courier::TopicDigestScheduleRequest::OrHash],
          template_id: String,
          audience_id: String,
          categories: T::Array[Courier::TopicDigestCategory::OrHash],
          trigger_empty: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The cadences this digest delivers on. At least one is required: a digest with no
        # schedule collects events into an instance that can never fire. Omitting the key
        # on a replace leaves stored schedules untouched; sending `[]` is a `400`.
        schedules:,
        # The notification template that renders the digest. A digest with no template
        # collects nothing, so this is required.
        template_id:,
        # Optional audience the digest is scoped to.
        audience_id: nil,
        # Retention rules per category key. Defaults to a single `digest` category
        # retaining `FIRST`.
        categories: nil,
        # Whether to deliver the digest even when nothing was collected.
        trigger_empty: nil
      )
      end

      sig do
        override.returns(
          {
            schedules: T::Array[Courier::TopicDigestScheduleRequest],
            template_id: String,
            audience_id: String,
            categories: T::Array[Courier::TopicDigestCategory],
            trigger_empty: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end

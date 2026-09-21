# typed: strong

module Courier
  module Models
    class TopicDigestRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestRequest, Courier::Internal::AnyHash)
        end

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

      # The cadences this digest delivers on.
      #
      # The array replaces the stored schedules wholesale, so a schedule you leave out
      # of it is deleted along with its delivery rule. Omit the key entirely to leave
      # the stored schedules untouched — useful for changing `template_id` or
      # `categories` without restating every schedule.
      #
      # A digest must end up with at least one schedule, because one with none collects
      # events into an instance that can never fire. So sending `[]` is always a `400`,
      # and so is omitting the key on a topic that has no schedules stored yet.
      #
      # On **create** the key is required outright: a topic being created has nothing
      # stored to leave alone, and the topic row is written before its digest, so
      # rejecting it any later would leave the topic behind and let a retry duplicate
      # it.
      sig { returns(T.nilable(T::Array[Courier::TopicDigestScheduleRequest])) }
      attr_reader :schedules

      sig do
        params(
          schedules: T::Array[Courier::TopicDigestScheduleRequest::OrHash]
        ).void
      end
      attr_writer :schedules

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
          template_id: String,
          audience_id: String,
          categories: T::Array[Courier::TopicDigestCategory::OrHash],
          schedules: T::Array[Courier::TopicDigestScheduleRequest::OrHash],
          trigger_empty: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The notification template that renders the digest. A digest with no template
        # collects nothing, so this is required.
        template_id:,
        # Optional audience the digest is scoped to.
        audience_id: nil,
        # Retention rules per category key. Defaults to a single `digest` category
        # retaining `FIRST`.
        categories: nil,
        # The cadences this digest delivers on.
        #
        # The array replaces the stored schedules wholesale, so a schedule you leave out
        # of it is deleted along with its delivery rule. Omit the key entirely to leave
        # the stored schedules untouched — useful for changing `template_id` or
        # `categories` without restating every schedule.
        #
        # A digest must end up with at least one schedule, because one with none collects
        # events into an instance that can never fire. So sending `[]` is always a `400`,
        # and so is omitting the key on a topic that has no schedules stored yet.
        #
        # On **create** the key is required outright: a topic being created has nothing
        # stored to leave alone, and the topic row is written before its digest, so
        # rejecting it any later would leave the topic behind and let a retry duplicate
        # it.
        schedules: nil,
        # Whether to deliver the digest even when nothing was collected.
        trigger_empty: nil
      )
      end

      sig do
        override.returns(
          {
            template_id: String,
            audience_id: String,
            categories: T::Array[Courier::TopicDigestCategory],
            schedules: T::Array[Courier::TopicDigestScheduleRequest],
            trigger_empty: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end

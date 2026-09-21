# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestRequest < Courier::Internal::Type::BaseModel
      # @!attribute template_id
      #   The notification template that renders the digest. A digest with no template
      #   collects nothing, so this is required.
      #
      #   @return [String]
      required :template_id, String

      # @!attribute audience_id
      #   Optional audience the digest is scoped to.
      #
      #   @return [String, nil]
      optional :audience_id, String

      # @!attribute categories
      #   Retention rules per category key. Defaults to a single `digest` category
      #   retaining `FIRST`.
      #
      #   @return [Array<Courier::Models::TopicDigestCategory>, nil]
      optional :categories, -> { Courier::Internal::Type::ArrayOf[Courier::TopicDigestCategory] }

      # @!attribute schedules
      #   The cadences this digest delivers on.
      #
      #   The array replaces the stored schedules wholesale, so a schedule you leave out
      #   of it is deleted along with its delivery rule. Omit the key entirely to leave
      #   the stored schedules untouched — useful for changing `template_id` or
      #   `categories` without restating every schedule.
      #
      #   A digest must end up with at least one schedule, because one with none collects
      #   events into an instance that can never fire. So sending `[]` is always a `400`,
      #   and so is omitting the key on a topic that has no schedules stored yet.
      #
      #   On **create** the key is required outright: a topic being created has nothing
      #   stored to leave alone, and the topic row is written before its digest, so
      #   rejecting it any later would leave the topic behind and let a retry duplicate
      #   it.
      #
      #   @return [Array<Courier::Models::TopicDigestScheduleRequest>, nil]
      optional :schedules, -> { Courier::Internal::Type::ArrayOf[Courier::TopicDigestScheduleRequest] }

      # @!attribute trigger_empty
      #   Whether to deliver the digest even when nothing was collected.
      #
      #   @return [Boolean, nil]
      optional :trigger_empty, Courier::Internal::Type::Boolean

      # @!method initialize(template_id:, audience_id: nil, categories: nil, schedules: nil, trigger_empty: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestRequest} for more details.
      #
      #   A topic's digest configuration: the template that renders it, the cadences it
      #   delivers on, and how collected events are retained.
      #
      #   Send `null` for the whole object to turn a digest off, which unlinks the
      #   template and removes its schedules. There is no `enabled` flag, and
      #   `schedules: []` is rejected, because both states are un-deliverable rather than
      #   merely off.
      #
      #   @param template_id [String] The notification template that renders the digest. A digest with no template col
      #
      #   @param audience_id [String] Optional audience the digest is scoped to.
      #
      #   @param categories [Array<Courier::Models::TopicDigestCategory>] Retention rules per category key. Defaults to a single `digest` category retaini
      #
      #   @param schedules [Array<Courier::Models::TopicDigestScheduleRequest>] The cadences this digest delivers on.
      #
      #   @param trigger_empty [Boolean] Whether to deliver the digest even when nothing was collected.
    end
  end
end

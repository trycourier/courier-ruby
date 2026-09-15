# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestRequest < Courier::Internal::Type::BaseModel
      # @!attribute schedules
      #   The cadences this digest delivers on. At least one is required: a digest with no
      #   schedule collects events into an instance that can never fire. Omitting the key
      #   on a replace leaves stored schedules untouched; sending `[]` is a `400`.
      #
      #   @return [Array<Courier::Models::TopicDigestScheduleRequest>]
      required :schedules, -> { Courier::Internal::Type::ArrayOf[Courier::TopicDigestScheduleRequest] }

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

      # @!attribute trigger_empty
      #   Whether to deliver the digest even when nothing was collected.
      #
      #   @return [Boolean, nil]
      optional :trigger_empty, Courier::Internal::Type::Boolean

      # @!method initialize(schedules:, template_id:, audience_id: nil, categories: nil, trigger_empty: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestRequest} for more details.
      #
      #   A topic's digest configuration: the template that renders it, the cadences it
      #   delivers on, and how collected events are retained.
      #
      #   Send `null` for the whole object to turn a digest off, which unlinks the
      #   template and removes its schedules. There is no `enabled` flag, and
      #   `schedules: []` is rejected -- both states are un-deliverable rather than merely
      #   off.
      #
      #   @param schedules [Array<Courier::Models::TopicDigestScheduleRequest>] The cadences this digest delivers on. At least one is required: a digest with no
      #
      #   @param template_id [String] The notification template that renders the digest. A digest with no template col
      #
      #   @param audience_id [String] Optional audience the digest is scoped to.
      #
      #   @param categories [Array<Courier::Models::TopicDigestCategory>] Retention rules per category key. Defaults to a single `digest` category retaini
      #
      #   @param trigger_empty [Boolean] Whether to deliver the digest even when nothing was collected.
    end
  end
end

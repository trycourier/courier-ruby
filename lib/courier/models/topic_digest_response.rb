# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestResponse < Courier::Internal::Type::BaseModel
      # @!attribute categories
      #   Retention rules per category key.
      #
      #   @return [Array<Courier::Models::TopicDigestCategory>]
      required :categories, -> { Courier::Internal::Type::ArrayOf[Courier::TopicDigestCategory] }

      # @!attribute schedules
      #   The digest's delivery cadences, each with its server-assigned `schedule_id`.
      #
      #   @return [Array<Courier::Models::TopicDigestScheduleResponse>]
      required :schedules, -> { Courier::Internal::Type::ArrayOf[Courier::TopicDigestScheduleResponse] }

      # @!attribute template_id
      #   The notification template that renders the digest.
      #
      #   @return [String]
      required :template_id, String

      # @!attribute audience_id
      #   The audience the digest is scoped to, when set.
      #
      #   @return [String, nil]
      optional :audience_id, String

      # @!attribute created
      #   ISO-8601 timestamp of when the digest was configured.
      #
      #   @return [String, nil]
      optional :created, String

      # @!attribute trigger_empty
      #   Whether the digest is delivered even when nothing was collected.
      #
      #   @return [Boolean, nil]
      optional :trigger_empty, Courier::Internal::Type::Boolean

      # @!attribute updated
      #   ISO-8601 timestamp of the last update.
      #
      #   @return [String, nil]
      optional :updated, String

      # @!method initialize(categories:, schedules:, template_id:, audience_id: nil, created: nil, trigger_empty: nil, updated: nil)
      #   A topic's digest configuration.
      #
      #   @param categories [Array<Courier::Models::TopicDigestCategory>] Retention rules per category key.
      #
      #   @param schedules [Array<Courier::Models::TopicDigestScheduleResponse>] The digest's delivery cadences, each with its server-assigned `schedule_id`.
      #
      #   @param template_id [String] The notification template that renders the digest.
      #
      #   @param audience_id [String] The audience the digest is scoped to, when set.
      #
      #   @param created [String] ISO-8601 timestamp of when the digest was configured.
      #
      #   @param trigger_empty [Boolean] Whether the digest is delivered even when nothing was collected.
      #
      #   @param updated [String] ISO-8601 timestamp of the last update.
    end
  end
end

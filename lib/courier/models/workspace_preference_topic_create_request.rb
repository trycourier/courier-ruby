# frozen_string_literal: true

module Courier
  module Models
    class WorkspacePreferenceTopicCreateRequest < Courier::Internal::Type::BaseModel
      # @!attribute default_status
      #   The default subscription status applied when a recipient has not set their own.
      #
      #   @return [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus]
      required :default_status, enum: -> { Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus }

      # @!attribute name
      #   Human-readable name for the preference topic.
      #
      #   @return [String]
      required :name, String

      # @!attribute allowed_preferences
      #   Preference controls a recipient may customize for this topic. Defaults to empty
      #   if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil]
      optional :allowed_preferences,
               -> {
                 Courier::Internal::Type::ArrayOf[enum: Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference]
               },
               nil?: true

      # @!attribute description
      #   Optional description shown under the topic on the hosted preferences page.
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute digest
      #   A topic's digest, as supplied when the topic itself is created: the template
      #   that renders it, the cadences it delivers on, and how collected events are
      #   retained.
      #
      #   Identical to `TopicDigestRequest`, which a replace uses, except that `schedules`
      #   is required — a topic being created has no stored schedules for an absent key to
      #   leave alone.
      #
      #   Send `null` for the whole object to turn a digest off, which unlinks the
      #   template and removes its schedules. There is no `enabled` flag, and
      #   `schedules: []` is rejected, because both states are un-deliverable rather than
      #   merely off.
      #
      #   @return [Courier::Models::WorkspacePreferenceTopicCreateRequest::Digest, nil]
      optional :digest, -> { Courier::WorkspacePreferenceTopicCreateRequest::Digest }, nil?: true

      # @!attribute include_unsubscribe_header
      #   Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @return [Boolean, nil]
      optional :include_unsubscribe_header, Courier::Internal::Type::Boolean, nil?: true

      # @!attribute routing_options
      #   Default channels delivered for this topic. Defaults to empty if omitted.
      #
      #   @return [Array<Symbol, Courier::Models::ChannelClassification>, nil]
      optional :routing_options,
               -> { Courier::Internal::Type::ArrayOf[enum: Courier::ChannelClassification] },
               nil?: true

      # @!attribute topic_data
      #   Arbitrary metadata associated with the topic.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :topic_data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(default_status:, name:, allowed_preferences: nil, description: nil, digest: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::WorkspacePreferenceTopicCreateRequest} for more details.
      #
      #   Request body for creating a preference topic.
      #
      #   @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus] The default subscription status applied when a recipient has not set their own.
      #
      #   @param name [String] Human-readable name for the preference topic.
      #
      #   @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil] Preference controls a recipient may customize for this topic. Defaults to empty
      #
      #   @param description [String, nil] Optional description shown under the topic on the hosted preferences page.
      #
      #   @param digest [Courier::Models::WorkspacePreferenceTopicCreateRequest::Digest, nil] A topic's digest, as supplied when the topic itself is created: the template tha
      #
      #   @param include_unsubscribe_header [Boolean, nil] Whether to include a list-unsubscribe header on emails for this topic.
      #
      #   @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels delivered for this topic. Defaults to empty if omitted.
      #
      #   @param topic_data [Hash{Symbol=>Object}, nil] Arbitrary metadata associated with the topic.

      # The default subscription status applied when a recipient has not set their own.
      #
      # @see Courier::Models::WorkspacePreferenceTopicCreateRequest#default_status
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        OPTED_OUT = :OPTED_OUT
        OPTED_IN = :OPTED_IN
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        SNOOZE = :snooze
        CHANNEL_PREFERENCES = :channel_preferences

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::WorkspacePreferenceTopicCreateRequest#digest
      class Digest < Courier::Internal::Type::BaseModel
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
        #   {Courier::Models::WorkspacePreferenceTopicCreateRequest::Digest} for more
        #   details.
        #
        #   A topic's digest, as supplied when the topic itself is created: the template
        #   that renders it, the cadences it delivers on, and how collected events are
        #   retained.
        #
        #   Identical to `TopicDigestRequest`, which a replace uses, except that `schedules`
        #   is required — a topic being created has no stored schedules for an absent key to
        #   leave alone.
        #
        #   Send `null` for the whole object to turn a digest off, which unlinks the
        #   template and removes its schedules. There is no `enabled` flag, and
        #   `schedules: []` is rejected, because both states are un-deliverable rather than
        #   merely off.
        #
        #   @param schedules [Array<Courier::Models::TopicDigestScheduleRequest>] The cadences this digest delivers on.
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
end

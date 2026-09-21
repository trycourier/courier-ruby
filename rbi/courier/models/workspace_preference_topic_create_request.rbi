# typed: strong

module Courier
  module Models
    class WorkspacePreferenceTopicCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::WorkspacePreferenceTopicCreateRequest,
            Courier::Internal::AnyHash
          )
        end

      # The default subscription status applied when a recipient has not set their own.
      sig do
        returns(
          Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol
        )
      end
      attr_accessor :default_status

      # Human-readable name for the preference topic.
      sig { returns(String) }
      attr_accessor :name

      # Preference controls a recipient may customize for this topic. Defaults to empty
      # if omitted.
      sig do
        returns(
          T.nilable(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
            ]
          )
        )
      end
      attr_accessor :allowed_preferences

      # Optional description shown under the topic on the hosted preferences page.
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # A topic's digest, as supplied when the topic itself is created: the template
      # that renders it, the cadences it delivers on, and how collected events are
      # retained.
      #
      # Identical to `TopicDigestRequest`, which a replace uses, except that `schedules`
      # is required — a topic being created has no stored schedules for an absent key to
      # leave alone.
      #
      # Send `null` for the whole object to turn a digest off, which unlinks the
      # template and removes its schedules. There is no `enabled` flag, and
      # `schedules: []` is rejected, because both states are un-deliverable rather than
      # merely off.
      sig do
        returns(
          T.nilable(Courier::WorkspacePreferenceTopicCreateRequest::Digest)
        )
      end
      attr_reader :digest

      sig do
        params(
          digest:
            T.nilable(
              Courier::WorkspacePreferenceTopicCreateRequest::Digest::OrHash
            )
        ).void
      end
      attr_writer :digest

      # Whether to include a list-unsubscribe header on emails for this topic.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :include_unsubscribe_header

      # Default channels delivered for this topic. Defaults to empty if omitted.
      sig do
        returns(T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]))
      end
      attr_accessor :routing_options

      # Arbitrary metadata associated with the topic.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :topic_data

      # Request body for creating a preference topic.
      sig do
        params(
          default_status:
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol,
          name: String,
          allowed_preferences:
            T.nilable(
              T::Array[
                Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
              ]
            ),
          description: T.nilable(String),
          digest:
            T.nilable(
              Courier::WorkspacePreferenceTopicCreateRequest::Digest::OrHash
            ),
          include_unsubscribe_header: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          topic_data: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(
        # The default subscription status applied when a recipient has not set their own.
        default_status:,
        # Human-readable name for the preference topic.
        name:,
        # Preference controls a recipient may customize for this topic. Defaults to empty
        # if omitted.
        allowed_preferences: nil,
        # Optional description shown under the topic on the hosted preferences page.
        description: nil,
        # A topic's digest, as supplied when the topic itself is created: the template
        # that renders it, the cadences it delivers on, and how collected events are
        # retained.
        #
        # Identical to `TopicDigestRequest`, which a replace uses, except that `schedules`
        # is required — a topic being created has no stored schedules for an absent key to
        # leave alone.
        #
        # Send `null` for the whole object to turn a digest off, which unlinks the
        # template and removes its schedules. There is no `enabled` flag, and
        # `schedules: []` is rejected, because both states are un-deliverable rather than
        # merely off.
        digest: nil,
        # Whether to include a list-unsubscribe header on emails for this topic.
        include_unsubscribe_header: nil,
        # Default channels delivered for this topic. Defaults to empty if omitted.
        routing_options: nil,
        # Arbitrary metadata associated with the topic.
        topic_data: nil
      )
      end

      sig do
        override.returns(
          {
            default_status:
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::OrSymbol,
            name: String,
            allowed_preferences:
              T.nilable(
                T::Array[
                  Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::OrSymbol
                ]
              ),
            description: T.nilable(String),
            digest:
              T.nilable(Courier::WorkspacePreferenceTopicCreateRequest::Digest),
            include_unsubscribe_header: T.nilable(T::Boolean),
            routing_options:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
            topic_data: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end

      # The default subscription status applied when a recipient has not set their own.
      module DefaultStatus
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_OUT =
          T.let(
            :OPTED_OUT,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )
        OPTED_IN =
          T.let(
            :OPTED_IN,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )
        REQUIRED =
          T.let(
            :REQUIRED,
            Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::DefaultStatus::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # A preference control a recipient may customize for a topic.
      module AllowedPreference
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SNOOZE =
          T.let(
            :snooze,
            Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
          )
        CHANNEL_PREFERENCES =
          T.let(
            :channel_preferences,
            Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::WorkspacePreferenceTopicCreateRequest::AllowedPreference::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Digest < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::WorkspacePreferenceTopicCreateRequest::Digest,
              Courier::Internal::AnyHash
            )
          end

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
          params(
            categories: T::Array[Courier::TopicDigestCategory::OrHash]
          ).void
        end
        attr_writer :categories

        # Whether to deliver the digest even when nothing was collected.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :trigger_empty

        sig { params(trigger_empty: T::Boolean).void }
        attr_writer :trigger_empty

        # A topic's digest, as supplied when the topic itself is created: the template
        # that renders it, the cadences it delivers on, and how collected events are
        # retained.
        #
        # Identical to `TopicDigestRequest`, which a replace uses, except that `schedules`
        # is required — a topic being created has no stored schedules for an absent key to
        # leave alone.
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
end

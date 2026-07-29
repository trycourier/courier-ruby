# typed: strong

module Courier
  module Models
    module Users
      class TopicPreference < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Users::TopicPreference, Courier::Internal::AnyHash)
          end

        # The topic's default status, returned on reads. It applies whenever the user has
        # no override of their own (status equals this value).
        sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
        attr_accessor :default_status

        # The user's subscription status for this topic. OPTED_IN or OPTED_OUT reflect the
        # user's own choice; REQUIRED is a topic-level default set in the preferences
        # editor, not a user choice.
        sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
        attr_accessor :status

        # The unique identifier of the subscription topic this preference applies to.
        sig { returns(String) }
        attr_accessor :topic_id

        # The display name of the subscription topic, returned on reads.
        sig { returns(String) }
        attr_accessor :topic_name

        # The channels the user has chosen to receive this topic on, present only when
        # has_custom_routing is true. One or more of: direct_message, email, push, sms,
        # webhook, inbox.
        sig do
          returns(
            T.nilable(T::Array[Courier::ChannelClassification::TaggedSymbol])
          )
        end
        attr_accessor :custom_routing

        # Whether the user has chosen specific delivery channels for this topic (listed in
        # custom_routing) rather than the topic's default routing.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :has_custom_routing

        sig do
          params(
            default_status: Courier::PreferenceStatus::OrSymbol,
            status: Courier::PreferenceStatus::OrSymbol,
            topic_id: String,
            topic_name: String,
            custom_routing:
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
            has_custom_routing: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # The topic's default status, returned on reads. It applies whenever the user has
          # no override of their own (status equals this value).
          default_status:,
          # The user's subscription status for this topic. OPTED_IN or OPTED_OUT reflect the
          # user's own choice; REQUIRED is a topic-level default set in the preferences
          # editor, not a user choice.
          status:,
          # The unique identifier of the subscription topic this preference applies to.
          topic_id:,
          # The display name of the subscription topic, returned on reads.
          topic_name:,
          # The channels the user has chosen to receive this topic on, present only when
          # has_custom_routing is true. One or more of: direct_message, email, push, sms,
          # webhook, inbox.
          custom_routing: nil,
          # Whether the user has chosen specific delivery channels for this topic (listed in
          # custom_routing) rather than the topic's default routing.
          has_custom_routing: nil
        )
        end

        sig do
          override.returns(
            {
              default_status: Courier::PreferenceStatus::TaggedSymbol,
              status: Courier::PreferenceStatus::TaggedSymbol,
              topic_id: String,
              topic_name: String,
              custom_routing:
                T.nilable(
                  T::Array[Courier::ChannelClassification::TaggedSymbol]
                ),
              has_custom_routing: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

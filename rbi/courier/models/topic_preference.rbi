# typed: strong

module Courier
  module Models
    class TopicPreference < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicPreference, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
      attr_accessor :default_status

      sig { returns(Courier::PreferenceStatus::TaggedSymbol) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :topic_id

      sig { returns(String) }
      attr_accessor :topic_name

      # The Channels a user has chosen to receive notifications through for this topic
      sig do
        returns(
          T.nilable(T::Array[Courier::ChannelClassification::TaggedSymbol])
        )
      end
      attr_accessor :custom_routing

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
        default_status:,
        status:,
        topic_id:,
        topic_name:,
        # The Channels a user has chosen to receive notifications through for this topic
        custom_routing: nil,
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
              T.nilable(T::Array[Courier::ChannelClassification::TaggedSymbol]),
            has_custom_routing: T.nilable(T::Boolean)
          }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    module Users
      class PreferenceUpdateOrCreateTopicParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::PreferenceUpdateOrCreateTopicParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(String) }
        attr_accessor :topic_id

        sig do
          returns(Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic)
        end
        attr_reader :topic

        sig do
          params(
            topic:
              Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash
          ).void
        end
        attr_writer :topic

        # Update the preferences of a user for this specific tenant context.
        sig { returns(T.nilable(String)) }
        attr_accessor :tenant_id

        sig do
          params(
            user_id: String,
            topic_id: String,
            topic:
              Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          topic_id:,
          topic:,
          # Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              topic_id: String,
              topic: Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic,
              tenant_id: T.nilable(String),
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Topic < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic,
                Courier::Internal::AnyHash
              )
            end

          # The subscription status to set: OPTED_IN or OPTED_OUT. REQUIRED is a topic-level
          # default, not a user choice; the API rejects opting a user out of a REQUIRED
          # topic.
          sig { returns(Courier::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          # The channels to deliver this topic on when has_custom_routing is true. One or
          # more of: direct_message, email, push, sms, webhook, inbox.
          sig do
            returns(
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
            )
          end
          attr_accessor :custom_routing

          # Set to true to route this topic to the channels in custom_routing instead of the
          # topic's default routing.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :has_custom_routing

          sig do
            params(
              status: Courier::PreferenceStatus::OrSymbol,
              custom_routing:
                T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
              has_custom_routing: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(
            # The subscription status to set: OPTED_IN or OPTED_OUT. REQUIRED is a topic-level
            # default, not a user choice; the API rejects opting a user out of a REQUIRED
            # topic.
            status:,
            # The channels to deliver this topic on when has_custom_routing is true. One or
            # more of: direct_message, email, push, sms, webhook, inbox.
            custom_routing: nil,
            # Set to true to route this topic to the channels in custom_routing instead of the
            # topic's default routing.
            has_custom_routing: nil
          )
          end

          sig do
            override.returns(
              {
                status: Courier::PreferenceStatus::OrSymbol,
                custom_routing:
                  T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
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
end

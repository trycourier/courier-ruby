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
            topic:
              Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
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

          sig { returns(Courier::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          # The Channels a user has chosen to receive notifications through for this topic
          sig do
            returns(
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
            )
          end
          attr_accessor :custom_routing

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
            status:,
            # The Channels a user has chosen to receive notifications through for this topic
            custom_routing: nil,
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

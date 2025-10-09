# typed: strong

module Trycourier
  module Models
    module Users
      class PreferenceUpdateOrCreateTopicParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::PreferenceUpdateOrCreateTopicParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig do
          returns(Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic)
        end
        attr_reader :topic

        sig do
          params(
            topic:
              Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash
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
              Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash,
            tenant_id: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
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
              topic:
                Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic,
              tenant_id: T.nilable(String),
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Topic < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Users::PreferenceUpdateOrCreateTopicParams::Topic,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(Trycourier::PreferenceStatus::OrSymbol) }
          attr_accessor :status

          # The Channels a user has chosen to receive notifications through for this topic
          sig do
            returns(
              T.nilable(T::Array[Trycourier::ChannelClassification::OrSymbol])
            )
          end
          attr_accessor :custom_routing

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :has_custom_routing

          sig do
            params(
              status: Trycourier::PreferenceStatus::OrSymbol,
              custom_routing:
                T.nilable(
                  T::Array[Trycourier::ChannelClassification::OrSymbol]
                ),
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
                status: Trycourier::PreferenceStatus::OrSymbol,
                custom_routing:
                  T.nilable(
                    T::Array[Trycourier::ChannelClassification::OrSymbol]
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
end

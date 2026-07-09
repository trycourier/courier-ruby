# typed: strong

module Courier
  module Models
    module Users
      class PreferenceBulkUpdateParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::PreferenceBulkUpdateParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        # The topics to create or update. Between 1 and 50 topics may be provided in a
        # single request.
        sig do
          returns(T::Array[Courier::Users::PreferenceBulkUpdateParams::Topic])
        end
        attr_accessor :topics

        # Update the preferences of a user for this specific tenant context.
        sig { returns(T.nilable(String)) }
        attr_accessor :tenant_id

        sig do
          params(
            user_id: String,
            topics:
              T::Array[
                Courier::Users::PreferenceBulkUpdateParams::Topic::OrHash
              ],
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          # The topics to create or update. Between 1 and 50 topics may be provided in a
          # single request.
          topics:,
          # Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              topics:
                T::Array[Courier::Users::PreferenceBulkUpdateParams::Topic],
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
                Courier::Users::PreferenceBulkUpdateParams::Topic,
                Courier::Internal::AnyHash
              )
            end

          # The subscription status to apply for this topic.
          sig do
            returns(
              Courier::Users::PreferenceBulkUpdateParams::Topic::Status::OrSymbol
            )
          end
          attr_accessor :status

          # A unique identifier associated with a subscription topic.
          sig { returns(String) }
          attr_accessor :topic_id

          # The channels a user has chosen to receive notifications through for this topic.
          sig do
            returns(
              T.nilable(T::Array[Courier::ChannelClassification::OrSymbol])
            )
          end
          attr_reader :custom_routing

          sig do
            params(
              custom_routing: T::Array[Courier::ChannelClassification::OrSymbol]
            ).void
          end
          attr_writer :custom_routing

          # Whether the recipient has chosen specific delivery channels for this topic.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_custom_routing

          sig { params(has_custom_routing: T::Boolean).void }
          attr_writer :has_custom_routing

          sig do
            params(
              status:
                Courier::Users::PreferenceBulkUpdateParams::Topic::Status::OrSymbol,
              topic_id: String,
              custom_routing:
                T::Array[Courier::ChannelClassification::OrSymbol],
              has_custom_routing: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            # The subscription status to apply for this topic.
            status:,
            # A unique identifier associated with a subscription topic.
            topic_id:,
            # The channels a user has chosen to receive notifications through for this topic.
            custom_routing: nil,
            # Whether the recipient has chosen specific delivery channels for this topic.
            has_custom_routing: nil
          )
          end

          sig do
            override.returns(
              {
                status:
                  Courier::Users::PreferenceBulkUpdateParams::Topic::Status::OrSymbol,
                topic_id: String,
                custom_routing:
                  T::Array[Courier::ChannelClassification::OrSymbol],
                has_custom_routing: T::Boolean
              }
            )
          end
          def to_hash
          end

          # The subscription status to apply for this topic.
          module Status
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Users::PreferenceBulkUpdateParams::Topic::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OPTED_IN =
              T.let(
                :OPTED_IN,
                Courier::Users::PreferenceBulkUpdateParams::Topic::Status::TaggedSymbol
              )
            OPTED_OUT =
              T.let(
                :OPTED_OUT,
                Courier::Users::PreferenceBulkUpdateParams::Topic::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Users::PreferenceBulkUpdateParams::Topic::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end

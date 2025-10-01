# typed: strong

module Courier
  module Models
    module Recipient
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::Recipient::AudienceRecipient,
            Courier::Recipient::UnionMember1,
            Courier::Recipient::UnionMember2,
            Courier::UserRecipient,
            Courier::Recipient::SlackRecipient,
            Courier::Recipient::MsTeamsRecipient,
            T::Hash[Symbol, T.anything],
            Courier::Recipient::PagerdutyRecipient,
            Courier::Recipient::WebhookRecipient
          )
        end

      class AudienceRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Recipient::AudienceRecipient,
              Courier::Internal::AnyHash
            )
          end

        # A unique identifier associated with an Audience. A message will be sent to each
        # user in the audience.
        sig { returns(String) }
        attr_accessor :audience_id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig do
          returns(
            T.nilable(T::Array[Courier::Recipient::AudienceRecipient::Filter])
          )
        end
        attr_accessor :filters

        sig do
          params(
            audience_id: String,
            data: T.nilable(T::Hash[Symbol, T.anything]),
            filters:
              T.nilable(
                T::Array[Courier::Recipient::AudienceRecipient::Filter::OrHash]
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier associated with an Audience. A message will be sent to each
          # user in the audience.
          audience_id:,
          data: nil,
          filters: nil
        )
        end

        sig do
          override.returns(
            {
              audience_id: String,
              data: T.nilable(T::Hash[Symbol, T.anything]),
              filters:
                T.nilable(
                  T::Array[Courier::Recipient::AudienceRecipient::Filter]
                )
            }
          )
        end
        def to_hash
        end

        class Filter < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Recipient::AudienceRecipient::Filter,
                Courier::Internal::AnyHash
              )
            end

          # Send to users only if they are member of the account
          sig do
            returns(
              Courier::Recipient::AudienceRecipient::Filter::Operator::OrSymbol
            )
          end
          attr_accessor :operator

          sig do
            returns(
              Courier::Recipient::AudienceRecipient::Filter::Path::OrSymbol
            )
          end
          attr_accessor :path

          sig { returns(String) }
          attr_accessor :value

          sig do
            params(
              operator:
                Courier::Recipient::AudienceRecipient::Filter::Operator::OrSymbol,
              path:
                Courier::Recipient::AudienceRecipient::Filter::Path::OrSymbol,
              value: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Send to users only if they are member of the account
            operator:,
            path:,
            value:
          )
          end

          sig do
            override.returns(
              {
                operator:
                  Courier::Recipient::AudienceRecipient::Filter::Operator::OrSymbol,
                path:
                  Courier::Recipient::AudienceRecipient::Filter::Path::OrSymbol,
                value: String
              }
            )
          end
          def to_hash
          end

          # Send to users only if they are member of the account
          module Operator
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::AudienceRecipient::Filter::Operator
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMBER_OF =
              T.let(
                :MEMBER_OF,
                Courier::Recipient::AudienceRecipient::Filter::Operator::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::AudienceRecipient::Filter::Operator::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Path
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::AudienceRecipient::Filter::Path
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACCOUNT_ID =
              T.let(
                :account_id,
                Courier::Recipient::AudienceRecipient::Filter::Path::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::AudienceRecipient::Filter::Path::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class UnionMember1 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Recipient::UnionMember1, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig do
          returns(T.nilable(T::Array[Courier::Recipient::UnionMember1::Filter]))
        end
        attr_accessor :filters

        sig { returns(T.nilable(String)) }
        attr_accessor :list_id

        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            filters:
              T.nilable(
                T::Array[Courier::Recipient::UnionMember1::Filter::OrHash]
              ),
            list_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(data: nil, filters: nil, list_id: nil)
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              filters:
                T.nilable(T::Array[Courier::Recipient::UnionMember1::Filter]),
              list_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Filter < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Recipient::UnionMember1::Filter,
                Courier::Internal::AnyHash
              )
            end

          # Send to users only if they are member of the account
          sig do
            returns(
              Courier::Recipient::UnionMember1::Filter::Operator::OrSymbol
            )
          end
          attr_accessor :operator

          sig do
            returns(Courier::Recipient::UnionMember1::Filter::Path::OrSymbol)
          end
          attr_accessor :path

          sig { returns(String) }
          attr_accessor :value

          sig do
            params(
              operator:
                Courier::Recipient::UnionMember1::Filter::Operator::OrSymbol,
              path: Courier::Recipient::UnionMember1::Filter::Path::OrSymbol,
              value: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Send to users only if they are member of the account
            operator:,
            path:,
            value:
          )
          end

          sig do
            override.returns(
              {
                operator:
                  Courier::Recipient::UnionMember1::Filter::Operator::OrSymbol,
                path: Courier::Recipient::UnionMember1::Filter::Path::OrSymbol,
                value: String
              }
            )
          end
          def to_hash
          end

          # Send to users only if they are member of the account
          module Operator
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::UnionMember1::Filter::Operator
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMBER_OF =
              T.let(
                :MEMBER_OF,
                Courier::Recipient::UnionMember1::Filter::Operator::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::UnionMember1::Filter::Operator::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Path
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Courier::Recipient::UnionMember1::Filter::Path)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACCOUNT_ID =
              T.let(
                :account_id,
                Courier::Recipient::UnionMember1::Filter::Path::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::UnionMember1::Filter::Path::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class UnionMember2 < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::Recipient::UnionMember2, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig { returns(T.nilable(String)) }
        attr_accessor :list_pattern

        sig do
          params(
            data: T.nilable(T::Hash[Symbol, T.anything]),
            list_pattern: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(data: nil, list_pattern: nil)
        end

        sig do
          override.returns(
            {
              data: T.nilable(T::Hash[Symbol, T.anything]),
              list_pattern: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class SlackRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Recipient::SlackRecipient,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel,
              Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail,
              Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID
            )
          )
        end
        attr_accessor :slack

        sig do
          params(
            slack:
              T.any(
                Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel::OrHash,
                Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail::OrHash,
                Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(slack:)
        end

        sig do
          override.returns(
            {
              slack:
                T.any(
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel,
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail,
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID
                )
            }
          )
        end
        def to_hash
        end

        module Slack
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel,
                Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail,
                Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID
              )
            end

          class SendToSlackChannel < Courier::Models::SlackBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :channel

            sig { params(channel: String).returns(T.attached_class) }
            def self.new(channel:)
            end

            sig { override.returns({ channel: String }) }
            def to_hash
            end
          end

          class SendToSlackEmail < Courier::Models::SlackBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :email

            sig { params(email: String).returns(T.attached_class) }
            def self.new(email:)
            end

            sig { override.returns({ email: String }) }
            def to_hash
            end
          end

          class SendToSlackUserID < Courier::Models::SlackBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :user_id

            sig { params(user_id: String).returns(T.attached_class) }
            def self.new(user_id:)
            end

            sig { override.returns({ user_id: String }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[Courier::Recipient::SlackRecipient::Slack::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class MsTeamsRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Recipient::MsTeamsRecipient,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID,
              Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail,
              Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID,
              Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID,
              Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName
            )
          )
        end
        attr_accessor :ms_teams

        sig do
          params(
            ms_teams:
              T.any(
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID::OrHash,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail::OrHash,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID::OrHash,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID::OrHash,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(ms_teams:)
        end

        sig do
          override.returns(
            {
              ms_teams:
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID,
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail,
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID,
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID,
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName
                )
            }
          )
        end
        def to_hash
        end

        module MsTeams
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID,
                Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName
              )
            end

          class SendToMsTeamsUserID < Courier::Models::MsTeamsBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :user_id

            sig { params(user_id: String).returns(T.attached_class) }
            def self.new(user_id:)
            end

            sig { override.returns({ user_id: String }) }
            def to_hash
            end
          end

          class SendToMsTeamsEmail < Courier::Models::MsTeamsBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :email

            sig { params(email: String).returns(T.attached_class) }
            def self.new(email:)
            end

            sig { override.returns({ email: String }) }
            def to_hash
            end
          end

          class SendToMsTeamsChannelID < Courier::Models::MsTeamsBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :channel_id

            sig { params(channel_id: String).returns(T.attached_class) }
            def self.new(channel_id:)
            end

            sig { override.returns({ channel_id: String }) }
            def to_hash
            end
          end

          class SendToMsTeamsConversationID < Courier::Models::MsTeamsBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :conversation_id

            sig { params(conversation_id: String).returns(T.attached_class) }
            def self.new(conversation_id:)
            end

            sig { override.returns({ conversation_id: String }) }
            def to_hash
            end
          end

          class SendToMsTeamsChannelName < Courier::Models::MsTeamsBaseProperties
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :channel_name

            sig { returns(String) }
            attr_accessor :team_id

            sig do
              params(channel_name: String, team_id: String).returns(
                T.attached_class
              )
            end
            def self.new(channel_name:, team_id:)
            end

            sig { override.returns({ channel_name: String, team_id: String }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[Courier::Recipient::MsTeamsRecipient::MsTeams::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class PagerdutyRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Recipient::PagerdutyRecipient,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::Recipient::PagerdutyRecipient::Pagerduty) }
        attr_reader :pagerduty

        sig do
          params(
            pagerduty: Courier::Recipient::PagerdutyRecipient::Pagerduty::OrHash
          ).void
        end
        attr_writer :pagerduty

        sig do
          params(
            pagerduty: Courier::Recipient::PagerdutyRecipient::Pagerduty::OrHash
          ).returns(T.attached_class)
        end
        def self.new(pagerduty:)
        end

        sig do
          override.returns(
            { pagerduty: Courier::Recipient::PagerdutyRecipient::Pagerduty }
          )
        end
        def to_hash
        end

        class Pagerduty < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Recipient::PagerdutyRecipient::Pagerduty,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :event_action

          sig { returns(T.nilable(String)) }
          attr_accessor :routing_key

          sig { returns(T.nilable(String)) }
          attr_accessor :severity

          sig { returns(T.nilable(String)) }
          attr_accessor :source

          sig do
            params(
              event_action: T.nilable(String),
              routing_key: T.nilable(String),
              severity: T.nilable(String),
              source: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            event_action: nil,
            routing_key: nil,
            severity: nil,
            source: nil
          )
          end

          sig do
            override.returns(
              {
                event_action: T.nilable(String),
                routing_key: T.nilable(String),
                severity: T.nilable(String),
                source: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      class WebhookRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Recipient::WebhookRecipient,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::Recipient::WebhookRecipient::Webhook) }
        attr_reader :webhook

        sig do
          params(
            webhook: Courier::Recipient::WebhookRecipient::Webhook::OrHash
          ).void
        end
        attr_writer :webhook

        sig do
          params(
            webhook: Courier::Recipient::WebhookRecipient::Webhook::OrHash
          ).returns(T.attached_class)
        end
        def self.new(webhook:)
        end

        sig do
          override.returns(
            { webhook: Courier::Recipient::WebhookRecipient::Webhook }
          )
        end
        def to_hash
        end

        class Webhook < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Recipient::WebhookRecipient::Webhook,
                Courier::Internal::AnyHash
              )
            end

          # The URL to send the webhook request to.
          sig { returns(String) }
          attr_accessor :url

          # Authentication configuration for the webhook request.
          sig do
            returns(
              T.nilable(
                Courier::Recipient::WebhookRecipient::Webhook::Authentication
              )
            )
          end
          attr_reader :authentication

          sig do
            params(
              authentication:
                T.nilable(
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::OrHash
                )
            ).void
          end
          attr_writer :authentication

          # Custom headers to include in the webhook request.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_accessor :headers

          # The HTTP method to use for the webhook request. Defaults to POST if not
          # specified.
          sig do
            returns(
              T.nilable(
                Courier::Recipient::WebhookRecipient::Webhook::Method::OrSymbol
              )
            )
          end
          attr_accessor :method_

          # Specifies what profile information is included in the request payload. Defaults
          # to 'limited' if not specified.
          sig do
            returns(
              T.nilable(
                Courier::Recipient::WebhookRecipient::Webhook::Profile::OrSymbol
              )
            )
          end
          attr_accessor :profile

          sig do
            params(
              url: String,
              authentication:
                T.nilable(
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::OrHash
                ),
              headers: T.nilable(T::Hash[Symbol, String]),
              method_:
                T.nilable(
                  Courier::Recipient::WebhookRecipient::Webhook::Method::OrSymbol
                ),
              profile:
                T.nilable(
                  Courier::Recipient::WebhookRecipient::Webhook::Profile::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The URL to send the webhook request to.
            url:,
            # Authentication configuration for the webhook request.
            authentication: nil,
            # Custom headers to include in the webhook request.
            headers: nil,
            # The HTTP method to use for the webhook request. Defaults to POST if not
            # specified.
            method_: nil,
            # Specifies what profile information is included in the request payload. Defaults
            # to 'limited' if not specified.
            profile: nil
          )
          end

          sig do
            override.returns(
              {
                url: String,
                authentication:
                  T.nilable(
                    Courier::Recipient::WebhookRecipient::Webhook::Authentication
                  ),
                headers: T.nilable(T::Hash[Symbol, String]),
                method_:
                  T.nilable(
                    Courier::Recipient::WebhookRecipient::Webhook::Method::OrSymbol
                  ),
                profile:
                  T.nilable(
                    Courier::Recipient::WebhookRecipient::Webhook::Profile::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          class Authentication < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication,
                  Courier::Internal::AnyHash
                )
              end

            # The authentication mode to use. Defaults to 'none' if not specified.
            sig do
              returns(
                Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::OrSymbol
              )
            end
            attr_accessor :mode

            # Token for bearer authentication.
            sig { returns(T.nilable(String)) }
            attr_accessor :token

            # Password for basic authentication.
            sig { returns(T.nilable(String)) }
            attr_accessor :password

            # Username for basic authentication.
            sig { returns(T.nilable(String)) }
            attr_accessor :username

            # Authentication configuration for the webhook request.
            sig do
              params(
                mode:
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::OrSymbol,
                token: T.nilable(String),
                password: T.nilable(String),
                username: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The authentication mode to use. Defaults to 'none' if not specified.
              mode:,
              # Token for bearer authentication.
              token: nil,
              # Password for basic authentication.
              password: nil,
              # Username for basic authentication.
              username: nil
            )
            end

            sig do
              override.returns(
                {
                  mode:
                    Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::OrSymbol,
                  token: T.nilable(String),
                  password: T.nilable(String),
                  username: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            # The authentication mode to use. Defaults to 'none' if not specified.
            module Mode
              extend Courier::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NONE =
                T.let(
                  :none,
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::TaggedSymbol
                )
              BASIC =
                T.let(
                  :basic,
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::TaggedSymbol
                )
              BEARER =
                T.let(
                  :bearer,
                  Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The HTTP method to use for the webhook request. Defaults to POST if not
          # specified.
          module Method
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::WebhookRecipient::Webhook::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            POST =
              T.let(
                :POST,
                Courier::Recipient::WebhookRecipient::Webhook::Method::TaggedSymbol
              )
            PUT =
              T.let(
                :PUT,
                Courier::Recipient::WebhookRecipient::Webhook::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::WebhookRecipient::Webhook::Method::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Specifies what profile information is included in the request payload. Defaults
          # to 'limited' if not specified.
          module Profile
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::Recipient::WebhookRecipient::Webhook::Profile
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIMITED =
              T.let(
                :limited,
                Courier::Recipient::WebhookRecipient::Webhook::Profile::TaggedSymbol
              )
            EXPANDED =
              T.let(
                :expanded,
                Courier::Recipient::WebhookRecipient::Webhook::Profile::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::Recipient::WebhookRecipient::Webhook::Profile::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      sig { override.returns(T::Array[Courier::Recipient::Variants]) }
      def self.variants
      end

      RecipientDataMap =
        T.let(
          Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown],
          Courier::Internal::Type::Converter
        )
    end
  end
end

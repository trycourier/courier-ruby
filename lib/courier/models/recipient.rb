# frozen_string_literal: true

module Courier
  module Models
    module Recipient
      extend Courier::Internal::Type::Union

      variant -> { Courier::Recipient::AudienceRecipient }

      variant -> { Courier::Recipient::UnionMember1 }

      variant -> { Courier::Recipient::UnionMember2 }

      variant -> { Courier::UserRecipient }

      variant -> { Courier::Recipient::SlackRecipient }

      variant -> { Courier::Recipient::MsTeamsRecipient }

      variant -> { Courier::Models::Recipient::RecipientDataMap }

      variant -> { Courier::Recipient::PagerdutyRecipient }

      variant -> { Courier::Recipient::WebhookRecipient }

      class AudienceRecipient < Courier::Internal::Type::BaseModel
        # @!attribute audience_id
        #   A unique identifier associated with an Audience. A message will be sent to each
        #   user in the audience.
        #
        #   @return [String]
        required :audience_id, String

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute filters
        #
        #   @return [Array<Courier::Models::Recipient::AudienceRecipient::Filter>, nil]
        optional :filters,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Recipient::AudienceRecipient::Filter] },
                 nil?: true

        # @!method initialize(audience_id:, data: nil, filters: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Recipient::AudienceRecipient} for more details.
        #
        #   @param audience_id [String] A unique identifier associated with an Audience. A message will be sent to each
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #
        #   @param filters [Array<Courier::Models::Recipient::AudienceRecipient::Filter>, nil]

        class Filter < Courier::Internal::Type::BaseModel
          # @!attribute operator
          #   Send to users only if they are member of the account
          #
          #   @return [Symbol, Courier::Models::Recipient::AudienceRecipient::Filter::Operator]
          required :operator, enum: -> { Courier::Recipient::AudienceRecipient::Filter::Operator }

          # @!attribute path
          #
          #   @return [Symbol, Courier::Models::Recipient::AudienceRecipient::Filter::Path]
          required :path, enum: -> { Courier::Recipient::AudienceRecipient::Filter::Path }

          # @!attribute value
          #
          #   @return [String]
          required :value, String

          # @!method initialize(operator:, path:, value:)
          #   @param operator [Symbol, Courier::Models::Recipient::AudienceRecipient::Filter::Operator] Send to users only if they are member of the account
          #
          #   @param path [Symbol, Courier::Models::Recipient::AudienceRecipient::Filter::Path]
          #
          #   @param value [String]

          # Send to users only if they are member of the account
          #
          # @see Courier::Models::Recipient::AudienceRecipient::Filter#operator
          module Operator
            extend Courier::Internal::Type::Enum

            MEMBER_OF = :MEMBER_OF

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::Recipient::AudienceRecipient::Filter#path
          module Path
            extend Courier::Internal::Type::Enum

            ACCOUNT_ID = :account_id

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class UnionMember1 < Courier::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute filters
        #
        #   @return [Array<Courier::Models::Recipient::UnionMember1::Filter>, nil]
        optional :filters,
                 -> { Courier::Internal::Type::ArrayOf[Courier::Recipient::UnionMember1::Filter] },
                 nil?: true

        # @!attribute list_id
        #
        #   @return [String, nil]
        optional :list_id, String, nil?: true

        # @!method initialize(data: nil, filters: nil, list_id: nil)
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param filters [Array<Courier::Models::Recipient::UnionMember1::Filter>, nil]
        #   @param list_id [String, nil]

        class Filter < Courier::Internal::Type::BaseModel
          # @!attribute operator
          #   Send to users only if they are member of the account
          #
          #   @return [Symbol, Courier::Models::Recipient::UnionMember1::Filter::Operator]
          required :operator, enum: -> { Courier::Recipient::UnionMember1::Filter::Operator }

          # @!attribute path
          #
          #   @return [Symbol, Courier::Models::Recipient::UnionMember1::Filter::Path]
          required :path, enum: -> { Courier::Recipient::UnionMember1::Filter::Path }

          # @!attribute value
          #
          #   @return [String]
          required :value, String

          # @!method initialize(operator:, path:, value:)
          #   @param operator [Symbol, Courier::Models::Recipient::UnionMember1::Filter::Operator] Send to users only if they are member of the account
          #
          #   @param path [Symbol, Courier::Models::Recipient::UnionMember1::Filter::Path]
          #
          #   @param value [String]

          # Send to users only if they are member of the account
          #
          # @see Courier::Models::Recipient::UnionMember1::Filter#operator
          module Operator
            extend Courier::Internal::Type::Enum

            MEMBER_OF = :MEMBER_OF

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::Recipient::UnionMember1::Filter#path
          module Path
            extend Courier::Internal::Type::Enum

            ACCOUNT_ID = :account_id

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      class UnionMember2 < Courier::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute list_pattern
        #
        #   @return [String, nil]
        optional :list_pattern, String, nil?: true

        # @!method initialize(data: nil, list_pattern: nil)
        #   @param data [Hash{Symbol=>Object}, nil]
        #   @param list_pattern [String, nil]
      end

      class SlackRecipient < Courier::Internal::Type::BaseModel
        # @!attribute slack
        #
        #   @return [Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackChannel, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackEmail, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackUserID]
        required :slack, union: -> { Courier::Recipient::SlackRecipient::Slack }

        # @!method initialize(slack:)
        #   @param slack [Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackChannel, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackEmail, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackUserID]

        # @see Courier::Models::Recipient::SlackRecipient#slack
        module Slack
          extend Courier::Internal::Type::Union

          variant -> { Courier::Recipient::SlackRecipient::Slack::SendToSlackChannel }

          variant -> { Courier::Recipient::SlackRecipient::Slack::SendToSlackEmail }

          variant -> { Courier::Recipient::SlackRecipient::Slack::SendToSlackUserID }

          class SendToSlackChannel < Courier::Models::SlackBaseProperties
            # @!attribute channel
            #
            #   @return [String]
            required :channel, String

            # @!method initialize(channel:)
            #   @param channel [String]
          end

          class SendToSlackEmail < Courier::Models::SlackBaseProperties
            # @!attribute email
            #
            #   @return [String]
            required :email, String

            # @!method initialize(email:)
            #   @param email [String]
          end

          class SendToSlackUserID < Courier::Models::SlackBaseProperties
            # @!attribute user_id
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(user_id:)
            #   @param user_id [String]
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackChannel, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackEmail, Courier::Models::Recipient::SlackRecipient::Slack::SendToSlackUserID)]
        end
      end

      class MsTeamsRecipient < Courier::Internal::Type::BaseModel
        # @!attribute ms_teams
        #
        #   @return [Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName]
        required :ms_teams, union: -> { Courier::Recipient::MsTeamsRecipient::MsTeams }

        # @!method initialize(ms_teams:)
        #   @param ms_teams [Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName]

        # @see Courier::Models::Recipient::MsTeamsRecipient#ms_teams
        module MsTeams
          extend Courier::Internal::Type::Union

          variant -> { Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID }

          variant -> { Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail }

          variant -> { Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID }

          variant -> { Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID }

          variant -> { Courier::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName }

          class SendToMsTeamsUserID < Courier::Models::MsTeamsBaseProperties
            # @!attribute user_id
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(user_id:)
            #   @param user_id [String]
          end

          class SendToMsTeamsEmail < Courier::Models::MsTeamsBaseProperties
            # @!attribute email
            #
            #   @return [String]
            required :email, String

            # @!method initialize(email:)
            #   @param email [String]
          end

          class SendToMsTeamsChannelID < Courier::Models::MsTeamsBaseProperties
            # @!attribute channel_id
            #
            #   @return [String]
            required :channel_id, String

            # @!method initialize(channel_id:)
            #   @param channel_id [String]
          end

          class SendToMsTeamsConversationID < Courier::Models::MsTeamsBaseProperties
            # @!attribute conversation_id
            #
            #   @return [String]
            required :conversation_id, String

            # @!method initialize(conversation_id:)
            #   @param conversation_id [String]
          end

          class SendToMsTeamsChannelName < Courier::Models::MsTeamsBaseProperties
            # @!attribute channel_name
            #
            #   @return [String]
            required :channel_name, String

            # @!attribute team_id
            #
            #   @return [String]
            required :team_id, String

            # @!method initialize(channel_name:, team_id:)
            #   @param channel_name [String]
            #   @param team_id [String]
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsUserID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsEmail, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsConversationID, Courier::Models::Recipient::MsTeamsRecipient::MsTeams::SendToMsTeamsChannelName)]
        end
      end

      class PagerdutyRecipient < Courier::Internal::Type::BaseModel
        # @!attribute pagerduty
        #
        #   @return [Courier::Models::Recipient::PagerdutyRecipient::Pagerduty]
        required :pagerduty, -> { Courier::Recipient::PagerdutyRecipient::Pagerduty }

        # @!method initialize(pagerduty:)
        #   @param pagerduty [Courier::Models::Recipient::PagerdutyRecipient::Pagerduty]

        # @see Courier::Models::Recipient::PagerdutyRecipient#pagerduty
        class Pagerduty < Courier::Internal::Type::BaseModel
          # @!attribute event_action
          #
          #   @return [String, nil]
          optional :event_action, String, nil?: true

          # @!attribute routing_key
          #
          #   @return [String, nil]
          optional :routing_key, String, nil?: true

          # @!attribute severity
          #
          #   @return [String, nil]
          optional :severity, String, nil?: true

          # @!attribute source
          #
          #   @return [String, nil]
          optional :source, String, nil?: true

          # @!method initialize(event_action: nil, routing_key: nil, severity: nil, source: nil)
          #   @param event_action [String, nil]
          #   @param routing_key [String, nil]
          #   @param severity [String, nil]
          #   @param source [String, nil]
        end
      end

      class WebhookRecipient < Courier::Internal::Type::BaseModel
        # @!attribute webhook
        #
        #   @return [Courier::Models::Recipient::WebhookRecipient::Webhook]
        required :webhook, -> { Courier::Recipient::WebhookRecipient::Webhook }

        # @!method initialize(webhook:)
        #   @param webhook [Courier::Models::Recipient::WebhookRecipient::Webhook]

        # @see Courier::Models::Recipient::WebhookRecipient#webhook
        class Webhook < Courier::Internal::Type::BaseModel
          # @!attribute url
          #   The URL to send the webhook request to.
          #
          #   @return [String]
          required :url, String

          # @!attribute authentication
          #   Authentication configuration for the webhook request.
          #
          #   @return [Courier::Models::Recipient::WebhookRecipient::Webhook::Authentication, nil]
          optional :authentication,
                   -> {
                     Courier::Recipient::WebhookRecipient::Webhook::Authentication
                   },
                   nil?: true

          # @!attribute headers
          #   Custom headers to include in the webhook request.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :headers, Courier::Internal::Type::HashOf[String], nil?: true

          # @!attribute method_
          #   The HTTP method to use for the webhook request. Defaults to POST if not
          #   specified.
          #
          #   @return [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Method, nil]
          optional :method_,
                   enum: -> { Courier::Recipient::WebhookRecipient::Webhook::Method },
                   api_name: :method,
                   nil?: true

          # @!attribute profile
          #   Specifies what profile information is included in the request payload. Defaults
          #   to 'limited' if not specified.
          #
          #   @return [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Profile, nil]
          optional :profile, enum: -> { Courier::Recipient::WebhookRecipient::Webhook::Profile }, nil?: true

          # @!method initialize(url:, authentication: nil, headers: nil, method_: nil, profile: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Recipient::WebhookRecipient::Webhook} for more details.
          #
          #   @param url [String] The URL to send the webhook request to.
          #
          #   @param authentication [Courier::Models::Recipient::WebhookRecipient::Webhook::Authentication, nil] Authentication configuration for the webhook request.
          #
          #   @param headers [Hash{Symbol=>String}, nil] Custom headers to include in the webhook request.
          #
          #   @param method_ [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Method, nil] The HTTP method to use for the webhook request. Defaults to POST if not specifie
          #
          #   @param profile [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Profile, nil] Specifies what profile information is included in the request payload. Defaults

          # @see Courier::Models::Recipient::WebhookRecipient::Webhook#authentication
          class Authentication < Courier::Internal::Type::BaseModel
            # @!attribute mode
            #   The authentication mode to use. Defaults to 'none' if not specified.
            #
            #   @return [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Authentication::Mode]
            required :mode, enum: -> { Courier::Recipient::WebhookRecipient::Webhook::Authentication::Mode }

            # @!attribute token
            #   Token for bearer authentication.
            #
            #   @return [String, nil]
            optional :token, String, nil?: true

            # @!attribute password
            #   Password for basic authentication.
            #
            #   @return [String, nil]
            optional :password, String, nil?: true

            # @!attribute username
            #   Username for basic authentication.
            #
            #   @return [String, nil]
            optional :username, String, nil?: true

            # @!method initialize(mode:, token: nil, password: nil, username: nil)
            #   Authentication configuration for the webhook request.
            #
            #   @param mode [Symbol, Courier::Models::Recipient::WebhookRecipient::Webhook::Authentication::Mode] The authentication mode to use. Defaults to 'none' if not specified.
            #
            #   @param token [String, nil] Token for bearer authentication.
            #
            #   @param password [String, nil] Password for basic authentication.
            #
            #   @param username [String, nil] Username for basic authentication.

            # The authentication mode to use. Defaults to 'none' if not specified.
            #
            # @see Courier::Models::Recipient::WebhookRecipient::Webhook::Authentication#mode
            module Mode
              extend Courier::Internal::Type::Enum

              NONE = :none
              BASIC = :basic
              BEARER = :bearer

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # The HTTP method to use for the webhook request. Defaults to POST if not
          # specified.
          #
          # @see Courier::Models::Recipient::WebhookRecipient::Webhook#method_
          module Method
            extend Courier::Internal::Type::Enum

            POST = :POST
            PUT = :PUT

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Specifies what profile information is included in the request payload. Defaults
          # to 'limited' if not specified.
          #
          # @see Courier::Models::Recipient::WebhookRecipient::Webhook#profile
          module Profile
            extend Courier::Internal::Type::Enum

            LIMITED = :limited
            EXPANDED = :expanded

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::Recipient::AudienceRecipient, Courier::Models::Recipient::UnionMember1, Courier::Models::Recipient::UnionMember2, Courier::Models::UserRecipient, Courier::Models::Recipient::SlackRecipient, Courier::Models::Recipient::MsTeamsRecipient, Hash{Symbol=>Object}, Courier::Models::Recipient::PagerdutyRecipient, Courier::Models::Recipient::WebhookRecipient)]

      # @type [Courier::Internal::Type::Converter]
      RecipientDataMap = Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]
    end
  end
end

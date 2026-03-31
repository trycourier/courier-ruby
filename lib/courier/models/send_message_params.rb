# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Send#message
    class SendMessageParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute message
      #   The message property has the following primary top-level properties. They define
      #   the destination and content of the message.
      #
      #   @return [Courier::Models::SendMessageParams::Message]
      required :message, -> { Courier::SendMessageParams::Message }

      # @!method initialize(message:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::SendMessageParams} for more details.
      #
      #   @param message [Courier::Models::SendMessageParams::Message] The message property has the following primary top-level properties. They define
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      class Message < Courier::Internal::Type::BaseModel
        # @!attribute brand_id
        #
        #   @return [String, nil]
        optional :brand_id, String, nil?: true

        # @!attribute channels
        #   Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #   inbox, direct_message, banner, webhook.
        #
        #   @return [Hash{Symbol=>Courier::Models::Channel}, nil]
        optional :channels, -> { Courier::Internal::Type::HashOf[Courier::Channel] }, nil?: true

        # @!attribute content
        #   Describes content that will work for email, inbox, push, chat, or any channel
        #   id.
        #
        #   @return [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent, nil]
        optional :content, union: -> { Courier::SendMessageParams::Message::Content }

        # @!attribute context
        #
        #   @return [Courier::Models::MessageContext, nil]
        optional :context, -> { Courier::MessageContext }, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute delay
        #
        #   @return [Courier::Models::SendMessageParams::Message::Delay, nil]
        optional :delay, -> { Courier::SendMessageParams::Message::Delay }, nil?: true

        # @!attribute expiry
        #
        #   @return [Courier::Models::SendMessageParams::Message::Expiry, nil]
        optional :expiry, -> { Courier::SendMessageParams::Message::Expiry }, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::SendMessageParams::Message::Metadata, nil]
        optional :metadata, -> { Courier::SendMessageParams::Message::Metadata }, nil?: true

        # @!attribute preferences
        #
        #   @return [Courier::Models::SendMessageParams::Message::Preferences, nil]
        optional :preferences, -> { Courier::SendMessageParams::Message::Preferences }, nil?: true

        # @!attribute providers
        #
        #   @return [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil]
        optional :providers, -> { Courier::Internal::Type::HashOf[Courier::MessageProvidersType] }, nil?: true

        # @!attribute routing
        #   Customize which channels/providers Courier may deliver the message through.
        #
        #   @return [Courier::Models::SendMessageParams::Message::Routing, nil]
        optional :routing, -> { Courier::SendMessageParams::Message::Routing }, nil?: true

        # @!attribute template
        #
        #   @return [String, nil]
        optional :template, String, nil?: true

        # @!attribute timeout
        #
        #   @return [Courier::Models::SendMessageParams::Message::Timeout, nil]
        optional :timeout, -> { Courier::SendMessageParams::Message::Timeout }, nil?: true

        # @!attribute to
        #   The recipient or a list of recipients of the message
        #
        #   @return [Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient, Array<Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient>, nil]
        optional :to, union: -> { Courier::SendMessageParams::Message::To }, nil?: true

        # @!method initialize(brand_id: nil, channels: nil, content: nil, context: nil, data: nil, delay: nil, expiry: nil, metadata: nil, preferences: nil, providers: nil, routing: nil, template: nil, timeout: nil, to: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::SendMessageParams::Message} for more details.
        #
        #   The message property has the following primary top-level properties. They define
        #   the destination and content of the message.
        #
        #   @param brand_id [String, nil]
        #
        #   @param channels [Hash{Symbol=>Courier::Models::Channel}, nil] Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #
        #   @param content [Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent] Describes content that will work for email, inbox, push, chat, or any channel id
        #
        #   @param context [Courier::Models::MessageContext, nil]
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #
        #   @param delay [Courier::Models::SendMessageParams::Message::Delay, nil]
        #
        #   @param expiry [Courier::Models::SendMessageParams::Message::Expiry, nil]
        #
        #   @param metadata [Courier::Models::SendMessageParams::Message::Metadata, nil]
        #
        #   @param preferences [Courier::Models::SendMessageParams::Message::Preferences, nil]
        #
        #   @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil]
        #
        #   @param routing [Courier::Models::SendMessageParams::Message::Routing, nil] Customize which channels/providers Courier may deliver the message through.
        #
        #   @param template [String, nil]
        #
        #   @param timeout [Courier::Models::SendMessageParams::Message::Timeout, nil]
        #
        #   @param to [Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient, Array<Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient>, nil] The recipient or a list of recipients of the message

        # Describes content that will work for email, inbox, push, chat, or any channel
        # id.
        #
        # @see Courier::Models::SendMessageParams::Message#content
        module Content
          extend Courier::Internal::Type::Union

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          variant -> { Courier::ElementalContentSugar }

          variant -> { Courier::ElementalContent }

          # @!method self.variants
          #   @return [Array(Courier::Models::ElementalContentSugar, Courier::Models::ElementalContent)]
        end

        # @see Courier::Models::SendMessageParams::Message#delay
        class Delay < Courier::Internal::Type::BaseModel
          # @!attribute duration
          #   The duration of the delay in milliseconds.
          #
          #   @return [Integer, nil]
          optional :duration, Integer, nil?: true

          # @!attribute timezone
          #   IANA timezone identifier (e.g., "America/Los_Angeles", "UTC"). Used when
          #   resolving opening hours expressions. Takes precedence over user profile timezone
          #   settings.
          #
          #   @return [String, nil]
          optional :timezone, String, nil?: true

          # @!attribute until_
          #   ISO 8601 timestamp or opening_hours-like format.
          #
          #   @return [String, nil]
          optional :until_, String, api_name: :until, nil?: true

          # @!method initialize(duration: nil, timezone: nil, until_: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::SendMessageParams::Message::Delay} for more details.
          #
          #   @param duration [Integer, nil] The duration of the delay in milliseconds.
          #
          #   @param timezone [String, nil] IANA timezone identifier (e.g., "America/Los_Angeles", "UTC"). Used when resolvi
          #
          #   @param until_ [String, nil] ISO 8601 timestamp or opening_hours-like format.
        end

        # @see Courier::Models::SendMessageParams::Message#expiry
        class Expiry < Courier::Internal::Type::BaseModel
          # @!attribute expires_in
          #   Duration in ms or ISO8601 duration (e.g. P1DT4H).
          #
          #   @return [String, Integer]
          required :expires_in, union: -> { Courier::SendMessageParams::Message::Expiry::ExpiresIn }

          # @!attribute expires_at
          #   Epoch or ISO8601 timestamp with timezone.
          #
          #   @return [String, nil]
          optional :expires_at, String, nil?: true

          # @!method initialize(expires_in:, expires_at: nil)
          #   @param expires_in [String, Integer] Duration in ms or ISO8601 duration (e.g. P1DT4H).
          #
          #   @param expires_at [String, nil] Epoch or ISO8601 timestamp with timezone.

          # Duration in ms or ISO8601 duration (e.g. P1DT4H).
          #
          # @see Courier::Models::SendMessageParams::Message::Expiry#expires_in
          module ExpiresIn
            extend Courier::Internal::Type::Union

            variant String

            variant Integer

            # @!method self.variants
            #   @return [Array(String, Integer)]
          end
        end

        # @see Courier::Models::SendMessageParams::Message#metadata
        class Metadata < Courier::Internal::Type::BaseModel
          # @!attribute event
          #
          #   @return [String, nil]
          optional :event, String, nil?: true

          # @!attribute tags
          #
          #   @return [Array<String>, nil]
          optional :tags, Courier::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute trace_id
          #
          #   @return [String, nil]
          optional :trace_id, String, nil?: true

          # @!attribute utm
          #
          #   @return [Courier::Models::Utm, nil]
          optional :utm, -> { Courier::Utm }, nil?: true

          # @!method initialize(event: nil, tags: nil, trace_id: nil, utm: nil)
          #   @param event [String, nil]
          #   @param tags [Array<String>, nil]
          #   @param trace_id [String, nil]
          #   @param utm [Courier::Models::Utm, nil]
        end

        # @see Courier::Models::SendMessageParams::Message#preferences
        class Preferences < Courier::Internal::Type::BaseModel
          # @!attribute subscription_topic_id
          #   The subscription topic to apply to the message.
          #
          #   @return [String]
          required :subscription_topic_id, String

          # @!method initialize(subscription_topic_id:)
          #   @param subscription_topic_id [String] The subscription topic to apply to the message.
        end

        # @see Courier::Models::SendMessageParams::Message#routing
        class Routing < Courier::Internal::Type::BaseModel
          # @!attribute channels
          #   A list of channels or providers (or nested routing rules).
          #
          #   @return [Array<String, Courier::Models::MessageRouting>]
          required :channels, -> { Courier::Internal::Type::ArrayOf[union: Courier::MessageRoutingChannel] }

          # @!attribute method_
          #
          #   @return [Symbol, Courier::Models::SendMessageParams::Message::Routing::Method]
          required :method_,
                   enum: -> {
                     Courier::SendMessageParams::Message::Routing::Method
                   },
                   api_name: :method

          # @!method initialize(channels:, method_:)
          #   Customize which channels/providers Courier may deliver the message through.
          #
          #   @param channels [Array<String, Courier::Models::MessageRouting>] A list of channels or providers (or nested routing rules).
          #
          #   @param method_ [Symbol, Courier::Models::SendMessageParams::Message::Routing::Method]

          # @see Courier::Models::SendMessageParams::Message::Routing#method_
          module Method
            extend Courier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Courier::Models::SendMessageParams::Message#timeout
        class Timeout < Courier::Internal::Type::BaseModel
          # @!attribute channel
          #
          #   @return [Hash{Symbol=>Integer}, nil]
          optional :channel, Courier::Internal::Type::HashOf[Integer], nil?: true

          # @!attribute criteria
          #
          #   @return [Symbol, Courier::Models::SendMessageParams::Message::Timeout::Criteria, nil]
          optional :criteria, enum: -> { Courier::SendMessageParams::Message::Timeout::Criteria }, nil?: true

          # @!attribute escalation
          #
          #   @return [Integer, nil]
          optional :escalation, Integer, nil?: true

          # @!attribute message
          #
          #   @return [Integer, nil]
          optional :message, Integer, nil?: true

          # @!attribute provider
          #
          #   @return [Hash{Symbol=>Integer}, nil]
          optional :provider, Courier::Internal::Type::HashOf[Integer], nil?: true

          # @!method initialize(channel: nil, criteria: nil, escalation: nil, message: nil, provider: nil)
          #   @param channel [Hash{Symbol=>Integer}, nil]
          #   @param criteria [Symbol, Courier::Models::SendMessageParams::Message::Timeout::Criteria, nil]
          #   @param escalation [Integer, nil]
          #   @param message [Integer, nil]
          #   @param provider [Hash{Symbol=>Integer}, nil]

          # @see Courier::Models::SendMessageParams::Message::Timeout#criteria
          module Criteria
            extend Courier::Internal::Type::Enum

            NO_ESCALATION = :"no-escalation"
            DELIVERED = :delivered
            VIEWED = :viewed
            ENGAGED = :engaged

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The recipient or a list of recipients of the message
        #
        # @see Courier::Models::SendMessageParams::Message#to
        module To
          extend Courier::Internal::Type::Union

          # Send to a specific user by user_id, email, phone_number, or list_id
          variant -> { Courier::UserRecipient }

          # Send to all users in an audience
          variant -> { Courier::AudienceRecipient }

          # Send to all users in a specific list
          variant -> { Courier::ListRecipient }

          # Send to users in lists matching a pattern
          variant -> { Courier::ListPatternRecipient }

          # Send via Slack (channel, email, or user_id)
          variant -> { Courier::SlackRecipient }

          # Send via Microsoft Teams
          variant -> { Courier::MsTeamsRecipient }

          # Send via PagerDuty
          variant -> { Courier::PagerdutyRecipient }

          # Send via webhook
          variant -> { Courier::WebhookRecipient }

          variant -> { Courier::Models::SendMessageParams::Message::To::UnionMember8Array }

          # A single recipient of the message. Choose one of the following types based on
          # how you want to identify the recipient: - **User**: Send to a specific user by
          # user_id, email, or phone number - **Audience**: Send to all users in an
          # audience - **List**: Send to all users in a list - **List Pattern**: Send to
          # users in lists matching a pattern - **Slack**: Send via Slack (channel, email,
          # or user_id) - **MS Teams**: Send via Microsoft Teams - **PagerDuty**: Send via
          # PagerDuty - **Webhook**: Send via webhook
          module UnionMember8
            extend Courier::Internal::Type::Union

            # Send to a specific user by user_id, email, phone_number, or list_id
            variant -> { Courier::UserRecipient }

            # Send to all users in an audience
            variant -> { Courier::AudienceRecipient }

            # Send to all users in a specific list
            variant -> { Courier::ListRecipient }

            # Send to users in lists matching a pattern
            variant -> { Courier::ListPatternRecipient }

            # Send via Slack (channel, email, or user_id)
            variant -> { Courier::SlackRecipient }

            # Send via Microsoft Teams
            variant -> { Courier::MsTeamsRecipient }

            # Send via PagerDuty
            variant -> { Courier::PagerdutyRecipient }

            # Send via webhook
            variant -> { Courier::WebhookRecipient }

            # @!method self.variants
            #   @return [Array(Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient)]
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient, Array<Courier::Models::UserRecipient, Courier::Models::AudienceRecipient, Courier::Models::ListRecipient, Courier::Models::ListPatternRecipient, Courier::Models::SlackRecipient, Courier::Models::MsTeamsRecipient, Courier::Models::PagerdutyRecipient, Courier::Models::WebhookRecipient>)]

          # @type [Courier::Internal::Type::Converter]
          UnionMember8Array =
            Courier::Internal::Type::ArrayOf[union: -> {
              Courier::SendMessageParams::Message::To::UnionMember8
            }]
        end
      end
    end
  end
end

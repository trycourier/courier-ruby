# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Send#send_message
    class SendSendMessageParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute message
      #   The message property has the following primary top-level properties. They define
      #   the destination and content of the message.
      #
      #   @return [Courier::Models::SendSendMessageParams::Message]
      required :message, -> { Courier::SendSendMessageParams::Message }

      # @!method initialize(message:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::SendSendMessageParams} for more details.
      #
      #   @param message [Courier::Models::SendSendMessageParams::Message] The message property has the following primary top-level properties. They define
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      class Message < Courier::Internal::Type::BaseModel
        # @!attribute content
        #   Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Content]
        required :content, -> { Courier::SendSendMessageParams::Message::Content }

        # @!attribute brand_id
        #
        #   @return [String, nil]
        optional :brand_id, String, nil?: true

        # @!attribute channels
        #   Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #   inbox, direct_message, banner, webhook.
        #
        #   @return [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::Channel}, nil]
        optional :channels,
                 -> { Courier::Internal::Type::HashOf[Courier::SendSendMessageParams::Message::Channel] },
                 nil?: true

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
        #   @return [Courier::Models::SendSendMessageParams::Message::Delay, nil]
        optional :delay, -> { Courier::SendSendMessageParams::Message::Delay }, nil?: true

        # @!attribute expiry
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Expiry, nil]
        optional :expiry, -> { Courier::SendSendMessageParams::Message::Expiry }, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Metadata, nil]
        optional :metadata, -> { Courier::SendSendMessageParams::Message::Metadata }, nil?: true

        # @!attribute preferences
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Preferences, nil]
        optional :preferences, -> { Courier::SendSendMessageParams::Message::Preferences }, nil?: true

        # @!attribute providers
        #
        #   @return [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::Provider}, nil]
        optional :providers,
                 -> { Courier::Internal::Type::HashOf[Courier::SendSendMessageParams::Message::Provider] },
                 nil?: true

        # @!attribute routing
        #   Customize which channels/providers Courier may deliver the message through.
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Routing, nil]
        optional :routing, -> { Courier::SendSendMessageParams::Message::Routing }, nil?: true

        # @!attribute timeout
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::Timeout, nil]
        optional :timeout, -> { Courier::SendSendMessageParams::Message::Timeout }, nil?: true

        # @!attribute to
        #   The recipient or a list of recipients of the message
        #
        #   @return [Courier::Models::SendSendMessageParams::Message::To::UnionMember0, Array<Courier::Models::Recipient>, nil]
        optional :to, union: -> { Courier::SendSendMessageParams::Message::To }, nil?: true

        # @!method initialize(content:, brand_id: nil, channels: nil, context: nil, data: nil, delay: nil, expiry: nil, metadata: nil, preferences: nil, providers: nil, routing: nil, timeout: nil, to: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::SendSendMessageParams::Message} for more details.
        #
        #   The message property has the following primary top-level properties. They define
        #   the destination and content of the message.
        #
        #   @param content [Courier::Models::SendSendMessageParams::Message::Content] Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @param brand_id [String, nil]
        #
        #   @param channels [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::Channel}, nil] Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #
        #   @param context [Courier::Models::MessageContext, nil]
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #
        #   @param delay [Courier::Models::SendSendMessageParams::Message::Delay, nil]
        #
        #   @param expiry [Courier::Models::SendSendMessageParams::Message::Expiry, nil]
        #
        #   @param metadata [Courier::Models::SendSendMessageParams::Message::Metadata, nil]
        #
        #   @param preferences [Courier::Models::SendSendMessageParams::Message::Preferences, nil]
        #
        #   @param providers [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::Provider}, nil]
        #
        #   @param routing [Courier::Models::SendSendMessageParams::Message::Routing, nil] Customize which channels/providers Courier may deliver the message through.
        #
        #   @param timeout [Courier::Models::SendSendMessageParams::Message::Timeout, nil]
        #
        #   @param to [Courier::Models::SendSendMessageParams::Message::To::UnionMember0, Array<Courier::Models::Recipient>, nil] The recipient or a list of recipients of the message

        # @see Courier::Models::SendSendMessageParams::Message#content
        class Content < Courier::Internal::Type::BaseModel
          # @!attribute body
          #   The text content displayed in the notification.
          #
          #   @return [String]
          required :body, String

          # @!attribute title
          #   Title/subject displayed by supported channels.
          #
          #   @return [String]
          required :title, String

          # @!method initialize(body:, title:)
          #   Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          #
          #   @param body [String] The text content displayed in the notification.
          #
          #   @param title [String] Title/subject displayed by supported channels.
        end

        class Channel < Courier::Internal::Type::BaseModel
          # @!attribute brand_id
          #   Brand id used for rendering.
          #
          #   @return [String, nil]
          optional :brand_id, String, nil?: true

          # @!attribute if_
          #   JS conditional with access to data/profile.
          #
          #   @return [String, nil]
          optional :if_, String, api_name: :if, nil?: true

          # @!attribute metadata
          #
          #   @return [Courier::Models::SendSendMessageParams::Message::Channel::Metadata, nil]
          optional :metadata, -> { Courier::SendSendMessageParams::Message::Channel::Metadata }, nil?: true

          # @!attribute override
          #   Channel specific overrides.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

          # @!attribute providers
          #   Providers enabled for this channel.
          #
          #   @return [Array<String>, nil]
          optional :providers, Courier::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute routing_method
          #   Defaults to `single`.
          #
          #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::Channel::RoutingMethod, nil]
          optional :routing_method,
                   enum: -> { Courier::SendSendMessageParams::Message::Channel::RoutingMethod },
                   nil?: true

          # @!attribute timeouts
          #
          #   @return [Courier::Models::SendSendMessageParams::Message::Channel::Timeouts, nil]
          optional :timeouts, -> { Courier::SendSendMessageParams::Message::Channel::Timeouts }, nil?: true

          # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
          #   @param brand_id [String, nil] Brand id used for rendering.
          #
          #   @param if_ [String, nil] JS conditional with access to data/profile.
          #
          #   @param metadata [Courier::Models::SendSendMessageParams::Message::Channel::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
          #
          #   @param providers [Array<String>, nil] Providers enabled for this channel.
          #
          #   @param routing_method [Symbol, Courier::Models::SendSendMessageParams::Message::Channel::RoutingMethod, nil] Defaults to `single`.
          #
          #   @param timeouts [Courier::Models::SendSendMessageParams::Message::Channel::Timeouts, nil]

          # @see Courier::Models::SendSendMessageParams::Message::Channel#metadata
          class Metadata < Courier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Courier::Models::SendSendMessageParams::Message::Channel::Metadata::Utm, nil]
            optional :utm, -> { Courier::SendSendMessageParams::Message::Channel::Metadata::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Courier::Models::SendSendMessageParams::Message::Channel::Metadata::Utm, nil]

            # @see Courier::Models::SendSendMessageParams::Message::Channel::Metadata#utm
            class Utm < Courier::Internal::Type::BaseModel
              # @!attribute campaign
              #
              #   @return [String, nil]
              optional :campaign, String, nil?: true

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!attribute medium
              #
              #   @return [String, nil]
              optional :medium, String, nil?: true

              # @!attribute source
              #
              #   @return [String, nil]
              optional :source, String, nil?: true

              # @!attribute term
              #
              #   @return [String, nil]
              optional :term, String, nil?: true

              # @!method initialize(campaign: nil, content: nil, medium: nil, source: nil, term: nil)
              #   @param campaign [String, nil]
              #   @param content [String, nil]
              #   @param medium [String, nil]
              #   @param source [String, nil]
              #   @param term [String, nil]
            end
          end

          # Defaults to `single`.
          #
          # @see Courier::Models::SendSendMessageParams::Message::Channel#routing_method
          module RoutingMethod
            extend Courier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::SendSendMessageParams::Message::Channel#timeouts
          class Timeouts < Courier::Internal::Type::BaseModel
            # @!attribute channel
            #
            #   @return [Integer, nil]
            optional :channel, Integer, nil?: true

            # @!attribute provider
            #
            #   @return [Integer, nil]
            optional :provider, Integer, nil?: true

            # @!method initialize(channel: nil, provider: nil)
            #   @param channel [Integer, nil]
            #   @param provider [Integer, nil]
          end
        end

        # @see Courier::Models::SendSendMessageParams::Message#delay
        class Delay < Courier::Internal::Type::BaseModel
          # @!attribute duration
          #   The duration of the delay in milliseconds.
          #
          #   @return [Integer, nil]
          optional :duration, Integer, nil?: true

          # @!attribute until_
          #   ISO 8601 timestamp or opening_hours-like format.
          #
          #   @return [String, nil]
          optional :until_, String, api_name: :until, nil?: true

          # @!method initialize(duration: nil, until_: nil)
          #   @param duration [Integer, nil] The duration of the delay in milliseconds.
          #
          #   @param until_ [String, nil] ISO 8601 timestamp or opening_hours-like format.
        end

        # @see Courier::Models::SendSendMessageParams::Message#expiry
        class Expiry < Courier::Internal::Type::BaseModel
          # @!attribute expires_in
          #   Duration in ms or ISO8601 duration (e.g. P1DT4H).
          #
          #   @return [String, Integer]
          required :expires_in, union: -> { Courier::SendSendMessageParams::Message::Expiry::ExpiresIn }

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
          # @see Courier::Models::SendSendMessageParams::Message::Expiry#expires_in
          module ExpiresIn
            extend Courier::Internal::Type::Union

            variant String

            variant Integer

            # @!method self.variants
            #   @return [Array(String, Integer)]
          end
        end

        # @see Courier::Models::SendSendMessageParams::Message#metadata
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
          #   @return [Courier::Models::SendSendMessageParams::Message::Metadata::Utm, nil]
          optional :utm, -> { Courier::SendSendMessageParams::Message::Metadata::Utm }, nil?: true

          # @!method initialize(event: nil, tags: nil, trace_id: nil, utm: nil)
          #   @param event [String, nil]
          #   @param tags [Array<String>, nil]
          #   @param trace_id [String, nil]
          #   @param utm [Courier::Models::SendSendMessageParams::Message::Metadata::Utm, nil]

          # @see Courier::Models::SendSendMessageParams::Message::Metadata#utm
          class Utm < Courier::Internal::Type::BaseModel
            # @!attribute campaign
            #
            #   @return [String, nil]
            optional :campaign, String, nil?: true

            # @!attribute content
            #
            #   @return [String, nil]
            optional :content, String, nil?: true

            # @!attribute medium
            #
            #   @return [String, nil]
            optional :medium, String, nil?: true

            # @!attribute source
            #
            #   @return [String, nil]
            optional :source, String, nil?: true

            # @!attribute term
            #
            #   @return [String, nil]
            optional :term, String, nil?: true

            # @!method initialize(campaign: nil, content: nil, medium: nil, source: nil, term: nil)
            #   @param campaign [String, nil]
            #   @param content [String, nil]
            #   @param medium [String, nil]
            #   @param source [String, nil]
            #   @param term [String, nil]
          end
        end

        # @see Courier::Models::SendSendMessageParams::Message#preferences
        class Preferences < Courier::Internal::Type::BaseModel
          # @!attribute subscription_topic_id
          #   The subscription topic to apply to the message.
          #
          #   @return [String]
          required :subscription_topic_id, String

          # @!method initialize(subscription_topic_id:)
          #   @param subscription_topic_id [String] The subscription topic to apply to the message.
        end

        class Provider < Courier::Internal::Type::BaseModel
          # @!attribute if_
          #   JS conditional with access to data/profile.
          #
          #   @return [String, nil]
          optional :if_, String, api_name: :if, nil?: true

          # @!attribute metadata
          #
          #   @return [Courier::Models::SendSendMessageParams::Message::Provider::Metadata, nil]
          optional :metadata, -> { Courier::SendSendMessageParams::Message::Provider::Metadata }, nil?: true

          # @!attribute override
          #   Provider-specific overrides.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

          # @!attribute timeouts
          #
          #   @return [Integer, nil]
          optional :timeouts, Integer, nil?: true

          # @!method initialize(if_: nil, metadata: nil, override: nil, timeouts: nil)
          #   @param if_ [String, nil] JS conditional with access to data/profile.
          #
          #   @param metadata [Courier::Models::SendSendMessageParams::Message::Provider::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Provider-specific overrides.
          #
          #   @param timeouts [Integer, nil]

          # @see Courier::Models::SendSendMessageParams::Message::Provider#metadata
          class Metadata < Courier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Courier::Models::SendSendMessageParams::Message::Provider::Metadata::Utm, nil]
            optional :utm, -> { Courier::SendSendMessageParams::Message::Provider::Metadata::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Courier::Models::SendSendMessageParams::Message::Provider::Metadata::Utm, nil]

            # @see Courier::Models::SendSendMessageParams::Message::Provider::Metadata#utm
            class Utm < Courier::Internal::Type::BaseModel
              # @!attribute campaign
              #
              #   @return [String, nil]
              optional :campaign, String, nil?: true

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!attribute medium
              #
              #   @return [String, nil]
              optional :medium, String, nil?: true

              # @!attribute source
              #
              #   @return [String, nil]
              optional :source, String, nil?: true

              # @!attribute term
              #
              #   @return [String, nil]
              optional :term, String, nil?: true

              # @!method initialize(campaign: nil, content: nil, medium: nil, source: nil, term: nil)
              #   @param campaign [String, nil]
              #   @param content [String, nil]
              #   @param medium [String, nil]
              #   @param source [String, nil]
              #   @param term [String, nil]
            end
          end
        end

        # @see Courier::Models::SendSendMessageParams::Message#routing
        class Routing < Courier::Internal::Type::BaseModel
          # @!attribute channels
          #   A list of channels or providers (or nested routing rules).
          #
          #   @return [Array<String, Courier::Models::MessageRouting>]
          required :channels, -> { Courier::Internal::Type::ArrayOf[union: Courier::MessageRoutingChannel] }

          # @!attribute method_
          #
          #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::Routing::Method]
          required :method_,
                   enum: -> { Courier::SendSendMessageParams::Message::Routing::Method },
                   api_name: :method

          # @!method initialize(channels:, method_:)
          #   Customize which channels/providers Courier may deliver the message through.
          #
          #   @param channels [Array<String, Courier::Models::MessageRouting>] A list of channels or providers (or nested routing rules).
          #
          #   @param method_ [Symbol, Courier::Models::SendSendMessageParams::Message::Routing::Method]

          # @see Courier::Models::SendSendMessageParams::Message::Routing#method_
          module Method
            extend Courier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Courier::Models::SendSendMessageParams::Message#timeout
        class Timeout < Courier::Internal::Type::BaseModel
          # @!attribute channel
          #
          #   @return [Hash{Symbol=>Integer}, nil]
          optional :channel, Courier::Internal::Type::HashOf[Integer], nil?: true

          # @!attribute criteria
          #
          #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::Timeout::Criteria, nil]
          optional :criteria,
                   enum: -> {
                     Courier::SendSendMessageParams::Message::Timeout::Criteria
                   },
                   nil?: true

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
          #   @param criteria [Symbol, Courier::Models::SendSendMessageParams::Message::Timeout::Criteria, nil]
          #   @param escalation [Integer, nil]
          #   @param message [Integer, nil]
          #   @param provider [Hash{Symbol=>Integer}, nil]

          # @see Courier::Models::SendSendMessageParams::Message::Timeout#criteria
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
        # @see Courier::Models::SendSendMessageParams::Message#to
        module To
          extend Courier::Internal::Type::Union

          variant -> { Courier::SendSendMessageParams::Message::To::UnionMember0 }

          variant -> { Courier::Models::SendSendMessageParams::Message::To::RecipientArray }

          class UnionMember0 < Courier::Internal::Type::BaseModel
            # @!attribute account_id
            #   Use `tenant_id` instead.
            #
            #   @return [String, nil]
            optional :account_id, String, nil?: true

            # @!attribute context
            #   Context such as tenant_id to send the notification with.
            #
            #   @return [Courier::Models::MessageContext, nil]
            optional :context, -> { Courier::MessageContext }, nil?: true

            # @!attribute data
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute email
            #
            #   @return [String, nil]
            optional :email, String, nil?: true

            # @!attribute locale
            #   The user's preferred ISO 639-1 language code.
            #
            #   @return [String, nil]
            optional :locale, String, nil?: true

            # @!attribute phone_number
            #
            #   @return [String, nil]
            optional :phone_number, String, nil?: true

            # @!attribute preferences
            #
            #   @return [Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences, nil]
            optional :preferences,
                     -> { Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences },
                     nil?: true

            # @!attribute tenant_id
            #   Tenant id. Will load brand, default preferences and base context data.
            #
            #   @return [String, nil]
            optional :tenant_id, String, nil?: true

            # @!attribute user_id
            #
            #   @return [String, nil]
            optional :user_id, String, nil?: true

            # @!method initialize(account_id: nil, context: nil, data: nil, email: nil, locale: nil, phone_number: nil, preferences: nil, tenant_id: nil, user_id: nil)
            #   @param account_id [String, nil] Use `tenant_id` instead.
            #
            #   @param context [Courier::Models::MessageContext, nil] Context such as tenant_id to send the notification with.
            #
            #   @param data [Hash{Symbol=>Object}, nil]
            #
            #   @param email [String, nil]
            #
            #   @param locale [String, nil] The user's preferred ISO 639-1 language code.
            #
            #   @param phone_number [String, nil]
            #
            #   @param preferences [Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences, nil]
            #
            #   @param tenant_id [String, nil] Tenant id. Will load brand, default preferences and base context data.
            #
            #   @param user_id [String, nil]

            # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0#preferences
            class Preferences < Courier::Internal::Type::BaseModel
              # @!attribute notifications
              #
              #   @return [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification}]
              required :notifications,
                       -> { Courier::Internal::Type::HashOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification] }

              # @!attribute categories
              #
              #   @return [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category}, nil]
              optional :categories,
                       -> {
                         Courier::Internal::Type::HashOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category]
                       },
                       nil?: true

              # @!attribute template_id
              #
              #   @return [String, nil]
              optional :template_id, String, api_name: :templateId, nil?: true

              # @!method initialize(notifications:, categories: nil, template_id: nil)
              #   @param notifications [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification}]
              #   @param categories [Hash{Symbol=>Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category}, nil]
              #   @param template_id [String, nil]

              class Notification < Courier::Internal::Type::BaseModel
                # @!attribute status
                #
                #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status]
                required :status,
                         enum: -> { Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status }

                # @!attribute channel_preferences
                #
                #   @return [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference>, nil]
                optional :channel_preferences,
                         -> {
                           Courier::Internal::Type::ArrayOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference]
                         },
                         nil?: true

                # @!attribute rules
                #
                #   @return [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule>, nil]
                optional :rules,
                         -> {
                           Courier::Internal::Type::ArrayOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule]
                         },
                         nil?: true

                # @!attribute source
                #
                #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source, nil]
                optional :source,
                         enum: -> {
                           Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source
                         },
                         nil?: true

                # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
                #   @param status [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status]
                #   @param channel_preferences [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference>, nil]
                #   @param rules [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule>, nil]
                #   @param source [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source, nil]

                # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification#status
                module Status
                  extend Courier::Internal::Type::Enum

                  OPTED_IN = :OPTED_IN
                  OPTED_OUT = :OPTED_OUT
                  REQUIRED = :REQUIRED

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class ChannelPreference < Courier::Internal::Type::BaseModel
                  # @!attribute channel
                  #
                  #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel]
                  required :channel,
                           enum: -> { Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel }

                  # @!method initialize(channel:)
                  #   @param channel [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel]

                  # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference#channel
                  module Channel
                    extend Courier::Internal::Type::Enum

                    DIRECT_MESSAGE = :direct_message
                    EMAIL = :email
                    PUSH = :push
                    SMS = :sms
                    WEBHOOK = :webhook
                    INBOX = :inbox

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                class Rule < Courier::Internal::Type::BaseModel
                  # @!attribute until_
                  #
                  #   @return [String]
                  required :until_, String, api_name: :until

                  # @!attribute start
                  #
                  #   @return [String, nil]
                  optional :start, String, nil?: true

                  # @!method initialize(until_:, start: nil)
                  #   @param until_ [String]
                  #   @param start [String, nil]
                end

                # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification#source
                module Source
                  extend Courier::Internal::Type::Enum

                  SUBSCRIPTION = :subscription
                  LIST = :list
                  RECIPIENT = :recipient

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              class Category < Courier::Internal::Type::BaseModel
                # @!attribute status
                #
                #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status]
                required :status,
                         enum: -> { Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status }

                # @!attribute channel_preferences
                #
                #   @return [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference>, nil]
                optional :channel_preferences,
                         -> {
                           Courier::Internal::Type::ArrayOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference]
                         },
                         nil?: true

                # @!attribute rules
                #
                #   @return [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule>, nil]
                optional :rules,
                         -> {
                           Courier::Internal::Type::ArrayOf[Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule]
                         },
                         nil?: true

                # @!attribute source
                #
                #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source, nil]
                optional :source,
                         enum: -> {
                           Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source
                         },
                         nil?: true

                # @!method initialize(status:, channel_preferences: nil, rules: nil, source: nil)
                #   @param status [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status]
                #   @param channel_preferences [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference>, nil]
                #   @param rules [Array<Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule>, nil]
                #   @param source [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source, nil]

                # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category#status
                module Status
                  extend Courier::Internal::Type::Enum

                  OPTED_IN = :OPTED_IN
                  OPTED_OUT = :OPTED_OUT
                  REQUIRED = :REQUIRED

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                class ChannelPreference < Courier::Internal::Type::BaseModel
                  # @!attribute channel
                  #
                  #   @return [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel]
                  required :channel,
                           enum: -> { Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel }

                  # @!method initialize(channel:)
                  #   @param channel [Symbol, Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel]

                  # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference#channel
                  module Channel
                    extend Courier::Internal::Type::Enum

                    DIRECT_MESSAGE = :direct_message
                    EMAIL = :email
                    PUSH = :push
                    SMS = :sms
                    WEBHOOK = :webhook
                    INBOX = :inbox

                    # @!method self.values
                    #   @return [Array<Symbol>]
                  end
                end

                class Rule < Courier::Internal::Type::BaseModel
                  # @!attribute until_
                  #
                  #   @return [String]
                  required :until_, String, api_name: :until

                  # @!attribute start
                  #
                  #   @return [String, nil]
                  optional :start, String, nil?: true

                  # @!method initialize(until_:, start: nil)
                  #   @param until_ [String]
                  #   @param start [String, nil]
                end

                # @see Courier::Models::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category#source
                module Source
                  extend Courier::Internal::Type::Enum

                  SUBSCRIPTION = :subscription
                  LIST = :list
                  RECIPIENT = :recipient

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end
            end
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::SendSendMessageParams::Message::To::UnionMember0, Array<Courier::Models::Recipient>)]

          # @type [Courier::Internal::Type::Converter]
          RecipientArray = Courier::Internal::Type::ArrayOf[-> { Courier::Recipient }]
        end
      end
    end
  end
end

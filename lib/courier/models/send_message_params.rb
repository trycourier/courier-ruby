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
        #   @return [Hash{Symbol=>Courier::Models::SendMessageParams::Message::Channel}, nil]
        optional :channels,
                 -> { Courier::Internal::Type::HashOf[Courier::SendMessageParams::Message::Channel] },
                 nil?: true

        # @!attribute content
        #   Describes content that will work for email, inbox, push, chat, or any channel
        #   id.
        #
        #   @return [Courier::Models::ElementalContentSugar, Courier::Models::Tenants::ElementalContent, nil]
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
        #   @return [Hash{Symbol=>Courier::Models::SendMessageParams::Message::Provider}, nil]
        optional :providers,
                 -> { Courier::Internal::Type::HashOf[Courier::SendMessageParams::Message::Provider] },
                 nil?: true

        # @!attribute routing
        #   Customize which channels/providers Courier may deliver the message through.
        #
        #   @return [Courier::Models::SendMessageParams::Message::Routing, nil]
        optional :routing, -> { Courier::SendMessageParams::Message::Routing }, nil?: true

        # @!attribute template
        #   The id of the template you want to send
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
        #   @return [Courier::Models::UserRecipient, Courier::Models::SendMessageParams::Message::To::ListRecipient, Array<Courier::Models::UserRecipient, Courier::Models::Recipient::ListRecipient>, nil]
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
        #   @param channels [Hash{Symbol=>Courier::Models::SendMessageParams::Message::Channel}, nil] Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #
        #   @param content [Courier::Models::ElementalContentSugar, Courier::Models::Tenants::ElementalContent] Describes content that will work for email, inbox, push, chat, or any channel id
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
        #   @param providers [Hash{Symbol=>Courier::Models::SendMessageParams::Message::Provider}, nil]
        #
        #   @param routing [Courier::Models::SendMessageParams::Message::Routing, nil] Customize which channels/providers Courier may deliver the message through.
        #
        #   @param template [String, nil] The id of the template you want to send
        #
        #   @param timeout [Courier::Models::SendMessageParams::Message::Timeout, nil]
        #
        #   @param to [Courier::Models::UserRecipient, Courier::Models::SendMessageParams::Message::To::ListRecipient, Array<Courier::Models::UserRecipient, Courier::Models::Recipient::ListRecipient>, nil] The recipient or a list of recipients of the message

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
          #   @return [Courier::Models::SendMessageParams::Message::Channel::Metadata, nil]
          optional :metadata, -> { Courier::SendMessageParams::Message::Channel::Metadata }, nil?: true

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
          #   @return [Symbol, Courier::Models::SendMessageParams::Message::Channel::RoutingMethod, nil]
          optional :routing_method,
                   enum: -> { Courier::SendMessageParams::Message::Channel::RoutingMethod },
                   nil?: true

          # @!attribute timeouts
          #
          #   @return [Courier::Models::SendMessageParams::Message::Channel::Timeouts, nil]
          optional :timeouts, -> { Courier::SendMessageParams::Message::Channel::Timeouts }, nil?: true

          # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
          #   @param brand_id [String, nil] Brand id used for rendering.
          #
          #   @param if_ [String, nil] JS conditional with access to data/profile.
          #
          #   @param metadata [Courier::Models::SendMessageParams::Message::Channel::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
          #
          #   @param providers [Array<String>, nil] Providers enabled for this channel.
          #
          #   @param routing_method [Symbol, Courier::Models::SendMessageParams::Message::Channel::RoutingMethod, nil] Defaults to `single`.
          #
          #   @param timeouts [Courier::Models::SendMessageParams::Message::Channel::Timeouts, nil]

          # @see Courier::Models::SendMessageParams::Message::Channel#metadata
          class Metadata < Courier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Courier::Models::Utm, nil]
            optional :utm, -> { Courier::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Courier::Models::Utm, nil]
          end

          # Defaults to `single`.
          #
          # @see Courier::Models::SendMessageParams::Message::Channel#routing_method
          module RoutingMethod
            extend Courier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Courier::Models::SendMessageParams::Message::Channel#timeouts
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

        # Describes content that will work for email, inbox, push, chat, or any channel
        # id.
        #
        # @see Courier::Models::SendMessageParams::Message#content
        module Content
          extend Courier::Internal::Type::Union

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          variant -> { Courier::ElementalContentSugar }

          variant -> { Courier::Tenants::ElementalContent }

          # @!method self.variants
          #   @return [Array(Courier::Models::ElementalContentSugar, Courier::Models::Tenants::ElementalContent)]
        end

        # @see Courier::Models::SendMessageParams::Message#delay
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

        class Provider < Courier::Internal::Type::BaseModel
          # @!attribute if_
          #   JS conditional with access to data/profile.
          #
          #   @return [String, nil]
          optional :if_, String, api_name: :if, nil?: true

          # @!attribute metadata
          #
          #   @return [Courier::Models::SendMessageParams::Message::Provider::Metadata, nil]
          optional :metadata, -> { Courier::SendMessageParams::Message::Provider::Metadata }, nil?: true

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
          #   @param metadata [Courier::Models::SendMessageParams::Message::Provider::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Provider-specific overrides.
          #
          #   @param timeouts [Integer, nil]

          # @see Courier::Models::SendMessageParams::Message::Provider#metadata
          class Metadata < Courier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Courier::Models::Utm, nil]
            optional :utm, -> { Courier::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Courier::Models::Utm, nil]
          end
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

          variant -> { Courier::UserRecipient }

          variant -> { Courier::SendMessageParams::Message::To::ListRecipient }

          variant -> { Courier::Models::SendMessageParams::Message::To::RecipientArray }

          class ListRecipient < Courier::Internal::Type::BaseModel
            # @!attribute data
            #
            #   @return [Hash{Symbol=>Object}, nil]
            optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

            # @!attribute list_id
            #
            #   @return [String, nil]
            optional :list_id, String, nil?: true

            # @!method initialize(data: nil, list_id: nil)
            #   @param data [Hash{Symbol=>Object}, nil]
            #   @param list_id [String, nil]
          end

          # @!method self.variants
          #   @return [Array(Courier::Models::UserRecipient, Courier::Models::SendMessageParams::Message::To::ListRecipient, Array<Courier::Models::UserRecipient, Courier::Models::Recipient::ListRecipient>)]

          # @type [Courier::Internal::Type::Converter]
          RecipientArray = Courier::Internal::Type::ArrayOf[union: -> { Courier::Recipient }]
        end
      end
    end
  end
end

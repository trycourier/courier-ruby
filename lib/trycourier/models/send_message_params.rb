# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::Send#message
    class SendMessageParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      # @!attribute message
      #   The message property has the following primary top-level properties. They define
      #   the destination and content of the message.
      #
      #   @return [Trycourier::Models::SendMessageParams::Message]
      required :message, -> { Trycourier::SendMessageParams::Message }

      # @!method initialize(message:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Trycourier::Models::SendMessageParams} for more details.
      #
      #   @param message [Trycourier::Models::SendMessageParams::Message] The message property has the following primary top-level properties. They define
      #
      #   @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}]

      class Message < Trycourier::Internal::Type::BaseModel
        # @!attribute brand_id
        #
        #   @return [String, nil]
        optional :brand_id, String, nil?: true

        # @!attribute channels
        #   Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #   inbox, direct_message, banner, webhook.
        #
        #   @return [Hash{Symbol=>Trycourier::Models::SendMessageParams::Message::Channel}, nil]
        optional :channels,
                 -> { Trycourier::Internal::Type::HashOf[Trycourier::SendMessageParams::Message::Channel] },
                 nil?: true

        # @!attribute content
        #   Describes content that will work for email, inbox, push, chat, or any channel
        #   id.
        #
        #   @return [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent, nil]
        optional :content, union: -> { Trycourier::SendMessageParams::Message::Content }

        # @!attribute context
        #
        #   @return [Trycourier::Models::MessageContext, nil]
        optional :context, -> { Trycourier::MessageContext }, nil?: true

        # @!attribute data
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :data, Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown], nil?: true

        # @!attribute delay
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Delay, nil]
        optional :delay, -> { Trycourier::SendMessageParams::Message::Delay }, nil?: true

        # @!attribute expiry
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Expiry, nil]
        optional :expiry, -> { Trycourier::SendMessageParams::Message::Expiry }, nil?: true

        # @!attribute metadata
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Metadata, nil]
        optional :metadata, -> { Trycourier::SendMessageParams::Message::Metadata }, nil?: true

        # @!attribute preferences
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Preferences, nil]
        optional :preferences, -> { Trycourier::SendMessageParams::Message::Preferences }, nil?: true

        # @!attribute providers
        #
        #   @return [Hash{Symbol=>Trycourier::Models::SendMessageParams::Message::Provider}, nil]
        optional :providers,
                 -> { Trycourier::Internal::Type::HashOf[Trycourier::SendMessageParams::Message::Provider] },
                 nil?: true

        # @!attribute routing
        #   Customize which channels/providers Courier may deliver the message through.
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Routing, nil]
        optional :routing, -> { Trycourier::SendMessageParams::Message::Routing }, nil?: true

        # @!attribute timeout
        #
        #   @return [Trycourier::Models::SendMessageParams::Message::Timeout, nil]
        optional :timeout, -> { Trycourier::SendMessageParams::Message::Timeout }, nil?: true

        # @!attribute to
        #   The recipient or a list of recipients of the message
        #
        #   @return [Trycourier::Models::UserRecipient, Array<Trycourier::Models::Recipient>, nil]
        optional :to, union: -> { Trycourier::SendMessageParams::Message::To }, nil?: true

        # @!method initialize(brand_id: nil, channels: nil, content: nil, context: nil, data: nil, delay: nil, expiry: nil, metadata: nil, preferences: nil, providers: nil, routing: nil, timeout: nil, to: nil)
        #   Some parameter documentations has been truncated, see
        #   {Trycourier::Models::SendMessageParams::Message} for more details.
        #
        #   The message property has the following primary top-level properties. They define
        #   the destination and content of the message.
        #
        #   @param brand_id [String, nil]
        #
        #   @param channels [Hash{Symbol=>Trycourier::Models::SendMessageParams::Message::Channel}, nil] Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        #
        #   @param content [Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent] Describes content that will work for email, inbox, push, chat, or any channel id
        #
        #   @param context [Trycourier::Models::MessageContext, nil]
        #
        #   @param data [Hash{Symbol=>Object}, nil]
        #
        #   @param delay [Trycourier::Models::SendMessageParams::Message::Delay, nil]
        #
        #   @param expiry [Trycourier::Models::SendMessageParams::Message::Expiry, nil]
        #
        #   @param metadata [Trycourier::Models::SendMessageParams::Message::Metadata, nil]
        #
        #   @param preferences [Trycourier::Models::SendMessageParams::Message::Preferences, nil]
        #
        #   @param providers [Hash{Symbol=>Trycourier::Models::SendMessageParams::Message::Provider}, nil]
        #
        #   @param routing [Trycourier::Models::SendMessageParams::Message::Routing, nil] Customize which channels/providers Courier may deliver the message through.
        #
        #   @param timeout [Trycourier::Models::SendMessageParams::Message::Timeout, nil]
        #
        #   @param to [Trycourier::Models::UserRecipient, Array<Trycourier::Models::Recipient>, nil] The recipient or a list of recipients of the message

        class Channel < Trycourier::Internal::Type::BaseModel
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
          #   @return [Trycourier::Models::SendMessageParams::Message::Channel::Metadata, nil]
          optional :metadata, -> { Trycourier::SendMessageParams::Message::Channel::Metadata }, nil?: true

          # @!attribute override
          #   Channel specific overrides.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :override,
                   Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
                   nil?: true

          # @!attribute providers
          #   Providers enabled for this channel.
          #
          #   @return [Array<String>, nil]
          optional :providers, Trycourier::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute routing_method
          #   Defaults to `single`.
          #
          #   @return [Symbol, Trycourier::Models::SendMessageParams::Message::Channel::RoutingMethod, nil]
          optional :routing_method,
                   enum: -> { Trycourier::SendMessageParams::Message::Channel::RoutingMethod },
                   nil?: true

          # @!attribute timeouts
          #
          #   @return [Trycourier::Models::SendMessageParams::Message::Channel::Timeouts, nil]
          optional :timeouts, -> { Trycourier::SendMessageParams::Message::Channel::Timeouts }, nil?: true

          # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
          #   @param brand_id [String, nil] Brand id used for rendering.
          #
          #   @param if_ [String, nil] JS conditional with access to data/profile.
          #
          #   @param metadata [Trycourier::Models::SendMessageParams::Message::Channel::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
          #
          #   @param providers [Array<String>, nil] Providers enabled for this channel.
          #
          #   @param routing_method [Symbol, Trycourier::Models::SendMessageParams::Message::Channel::RoutingMethod, nil] Defaults to `single`.
          #
          #   @param timeouts [Trycourier::Models::SendMessageParams::Message::Channel::Timeouts, nil]

          # @see Trycourier::Models::SendMessageParams::Message::Channel#metadata
          class Metadata < Trycourier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Trycourier::Models::Utm, nil]
            optional :utm, -> { Trycourier::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Trycourier::Models::Utm, nil]
          end

          # Defaults to `single`.
          #
          # @see Trycourier::Models::SendMessageParams::Message::Channel#routing_method
          module RoutingMethod
            extend Trycourier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Trycourier::Models::SendMessageParams::Message::Channel#timeouts
          class Timeouts < Trycourier::Internal::Type::BaseModel
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
        # @see Trycourier::Models::SendMessageParams::Message#content
        module Content
          extend Trycourier::Internal::Type::Union

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          variant -> { Trycourier::ElementalContentSugar }

          variant -> { Trycourier::ElementalContent }

          # @!method self.variants
          #   @return [Array(Trycourier::Models::ElementalContentSugar, Trycourier::Models::ElementalContent)]
        end

        # @see Trycourier::Models::SendMessageParams::Message#delay
        class Delay < Trycourier::Internal::Type::BaseModel
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

        # @see Trycourier::Models::SendMessageParams::Message#expiry
        class Expiry < Trycourier::Internal::Type::BaseModel
          # @!attribute expires_in
          #   Duration in ms or ISO8601 duration (e.g. P1DT4H).
          #
          #   @return [String, Integer]
          required :expires_in, union: -> { Trycourier::SendMessageParams::Message::Expiry::ExpiresIn }

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
          # @see Trycourier::Models::SendMessageParams::Message::Expiry#expires_in
          module ExpiresIn
            extend Trycourier::Internal::Type::Union

            variant String

            variant Integer

            # @!method self.variants
            #   @return [Array(String, Integer)]
          end
        end

        # @see Trycourier::Models::SendMessageParams::Message#metadata
        class Metadata < Trycourier::Internal::Type::BaseModel
          # @!attribute event
          #
          #   @return [String, nil]
          optional :event, String, nil?: true

          # @!attribute tags
          #
          #   @return [Array<String>, nil]
          optional :tags, Trycourier::Internal::Type::ArrayOf[String], nil?: true

          # @!attribute trace_id
          #
          #   @return [String, nil]
          optional :trace_id, String, nil?: true

          # @!attribute utm
          #
          #   @return [Trycourier::Models::Utm, nil]
          optional :utm, -> { Trycourier::Utm }, nil?: true

          # @!method initialize(event: nil, tags: nil, trace_id: nil, utm: nil)
          #   @param event [String, nil]
          #   @param tags [Array<String>, nil]
          #   @param trace_id [String, nil]
          #   @param utm [Trycourier::Models::Utm, nil]
        end

        # @see Trycourier::Models::SendMessageParams::Message#preferences
        class Preferences < Trycourier::Internal::Type::BaseModel
          # @!attribute subscription_topic_id
          #   The subscription topic to apply to the message.
          #
          #   @return [String]
          required :subscription_topic_id, String

          # @!method initialize(subscription_topic_id:)
          #   @param subscription_topic_id [String] The subscription topic to apply to the message.
        end

        class Provider < Trycourier::Internal::Type::BaseModel
          # @!attribute if_
          #   JS conditional with access to data/profile.
          #
          #   @return [String, nil]
          optional :if_, String, api_name: :if, nil?: true

          # @!attribute metadata
          #
          #   @return [Trycourier::Models::SendMessageParams::Message::Provider::Metadata, nil]
          optional :metadata, -> { Trycourier::SendMessageParams::Message::Provider::Metadata }, nil?: true

          # @!attribute override
          #   Provider-specific overrides.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :override,
                   Trycourier::Internal::Type::HashOf[Trycourier::Internal::Type::Unknown],
                   nil?: true

          # @!attribute timeouts
          #
          #   @return [Integer, nil]
          optional :timeouts, Integer, nil?: true

          # @!method initialize(if_: nil, metadata: nil, override: nil, timeouts: nil)
          #   @param if_ [String, nil] JS conditional with access to data/profile.
          #
          #   @param metadata [Trycourier::Models::SendMessageParams::Message::Provider::Metadata, nil]
          #
          #   @param override [Hash{Symbol=>Object}, nil] Provider-specific overrides.
          #
          #   @param timeouts [Integer, nil]

          # @see Trycourier::Models::SendMessageParams::Message::Provider#metadata
          class Metadata < Trycourier::Internal::Type::BaseModel
            # @!attribute utm
            #
            #   @return [Trycourier::Models::Utm, nil]
            optional :utm, -> { Trycourier::Utm }, nil?: true

            # @!method initialize(utm: nil)
            #   @param utm [Trycourier::Models::Utm, nil]
          end
        end

        # @see Trycourier::Models::SendMessageParams::Message#routing
        class Routing < Trycourier::Internal::Type::BaseModel
          # @!attribute channels
          #   A list of channels or providers (or nested routing rules).
          #
          #   @return [Array<String, Trycourier::Models::MessageRouting>]
          required :channels, -> { Trycourier::Internal::Type::ArrayOf[union: Trycourier::MessageRoutingChannel] }

          # @!attribute method_
          #
          #   @return [Symbol, Trycourier::Models::SendMessageParams::Message::Routing::Method]
          required :method_,
                   enum: -> {
                     Trycourier::SendMessageParams::Message::Routing::Method
                   },
                   api_name: :method

          # @!method initialize(channels:, method_:)
          #   Customize which channels/providers Courier may deliver the message through.
          #
          #   @param channels [Array<String, Trycourier::Models::MessageRouting>] A list of channels or providers (or nested routing rules).
          #
          #   @param method_ [Symbol, Trycourier::Models::SendMessageParams::Message::Routing::Method]

          # @see Trycourier::Models::SendMessageParams::Message::Routing#method_
          module Method
            extend Trycourier::Internal::Type::Enum

            ALL = :all
            SINGLE = :single

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Trycourier::Models::SendMessageParams::Message#timeout
        class Timeout < Trycourier::Internal::Type::BaseModel
          # @!attribute channel
          #
          #   @return [Hash{Symbol=>Integer}, nil]
          optional :channel, Trycourier::Internal::Type::HashOf[Integer], nil?: true

          # @!attribute criteria
          #
          #   @return [Symbol, Trycourier::Models::SendMessageParams::Message::Timeout::Criteria, nil]
          optional :criteria,
                   enum: -> {
                     Trycourier::SendMessageParams::Message::Timeout::Criteria
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
          optional :provider, Trycourier::Internal::Type::HashOf[Integer], nil?: true

          # @!method initialize(channel: nil, criteria: nil, escalation: nil, message: nil, provider: nil)
          #   @param channel [Hash{Symbol=>Integer}, nil]
          #   @param criteria [Symbol, Trycourier::Models::SendMessageParams::Message::Timeout::Criteria, nil]
          #   @param escalation [Integer, nil]
          #   @param message [Integer, nil]
          #   @param provider [Hash{Symbol=>Integer}, nil]

          # @see Trycourier::Models::SendMessageParams::Message::Timeout#criteria
          module Criteria
            extend Trycourier::Internal::Type::Enum

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
        # @see Trycourier::Models::SendMessageParams::Message#to
        module To
          extend Trycourier::Internal::Type::Union

          variant -> { Trycourier::UserRecipient }

          variant -> { Trycourier::Models::SendMessageParams::Message::To::RecipientArray }

          # @!method self.variants
          #   @return [Array(Trycourier::Models::UserRecipient, Array<Trycourier::Models::Recipient>)]

          # @type [Trycourier::Internal::Type::Converter]
          RecipientArray = Trycourier::Internal::Type::ArrayOf[-> { Trycourier::Recipient }]
        end
      end
    end
  end
end

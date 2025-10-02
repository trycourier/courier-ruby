# frozen_string_literal: true

module Courier
  module Models
    class BaseMessage < Courier::Internal::Type::BaseModel
      # @!attribute brand_id
      #
      #   @return [String, nil]
      optional :brand_id, String, nil?: true

      # @!attribute channels
      #   "Define run-time configuration for one or more channels. If you don't specify
      #   channels, the default configuration for each channel will be used. Valid
      #   ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
      #
      #   @return [Hash{Symbol=>Courier::Models::BaseMessage::Channel}, nil]
      optional :channels, -> { Courier::Internal::Type::HashOf[Courier::BaseMessage::Channel] }, nil?: true

      # @!attribute context
      #   Context to load with this recipient. Will override any context set on
      #   message.context.
      #
      #   @return [Courier::Models::MessageContext, nil]
      optional :context, -> { Courier::MessageContext }, nil?: true

      # @!attribute data
      #   An arbitrary object that includes any data you want to pass to the message. The
      #   data will populate the corresponding template or elements variables.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :data, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!attribute delay
      #   Defines the time to wait before delivering the message. You can specify one of
      #   the following options. Duration with the number of milliseconds to delay. Until
      #   with an ISO 8601 timestamp that specifies when it should be delivered. Until
      #   with an OpenStreetMap opening_hours-like format that specifies the
      #   [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
      #   (e.g., 'Mo-Fr 08:00-18:00pm')
      #
      #   @return [Courier::Models::BaseMessage::Delay, nil]
      optional :delay, -> { Courier::BaseMessage::Delay }, nil?: true

      # @!attribute expiry
      #   "Expiry allows you to set an absolute or relative time in which a message
      #   expires. Note: This is only valid for the Courier Inbox channel as of
      #   12-08-2022."
      #
      #   @return [Courier::Models::BaseMessage::Expiry, nil]
      optional :expiry, -> { Courier::BaseMessage::Expiry }, nil?: true

      # @!attribute metadata
      #   Metadata such as utm tracking attached with the notification through this
      #   channel.
      #
      #   @return [Courier::Models::BaseMessage::Metadata, nil]
      optional :metadata, -> { Courier::BaseMessage::Metadata }, nil?: true

      # @!attribute preferences
      #
      #   @return [Courier::Models::BaseMessage::Preferences, nil]
      optional :preferences, -> { Courier::BaseMessage::Preferences }, nil?: true

      # @!attribute providers
      #   An object whose keys are valid provider identifiers which map to an object.
      #
      #   @return [Hash{Symbol=>Courier::Models::BaseMessage::Provider}, nil]
      optional :providers, -> { Courier::Internal::Type::HashOf[Courier::BaseMessage::Provider] }, nil?: true

      # @!attribute routing
      #   Allows you to customize which channel(s) Courier will potentially deliver the
      #   message. If no routing key is specified, Courier will use the default routing
      #   configuration or routing defined by the template.
      #
      #   @return [Courier::Models::BaseMessage::Routing, nil]
      optional :routing, -> { Courier::BaseMessage::Routing }, nil?: true

      # @!attribute timeout
      #   Time in ms to attempt the channel before failing over to the next available
      #   channel.
      #
      #   @return [Courier::Models::BaseMessage::Timeout, nil]
      optional :timeout, -> { Courier::BaseMessage::Timeout }, nil?: true

      # @!method initialize(brand_id: nil, channels: nil, context: nil, data: nil, delay: nil, expiry: nil, metadata: nil, preferences: nil, providers: nil, routing: nil, timeout: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::BaseMessage} for more details.
      #
      #   @param brand_id [String, nil]
      #
      #   @param channels [Hash{Symbol=>Courier::Models::BaseMessage::Channel}, nil] "Define run-time configuration for one or more channels. If you don't specify ch
      #
      #   @param context [Courier::Models::MessageContext, nil] Context to load with this recipient. Will override any context set on message.co
      #
      #   @param data [Hash{Symbol=>Object}, nil] An arbitrary object that includes any data you want to pass to the message.
      #
      #   @param delay [Courier::Models::BaseMessage::Delay, nil] Defines the time to wait before delivering the message. You can specify one of t
      #
      #   @param expiry [Courier::Models::BaseMessage::Expiry, nil] "Expiry allows you to set an absolute or relative time in which a message expire
      #
      #   @param metadata [Courier::Models::BaseMessage::Metadata, nil] Metadata such as utm tracking attached with the notification through this channe
      #
      #   @param preferences [Courier::Models::BaseMessage::Preferences, nil]
      #
      #   @param providers [Hash{Symbol=>Courier::Models::BaseMessage::Provider}, nil] An object whose keys are valid provider identifiers which map to an object.
      #
      #   @param routing [Courier::Models::BaseMessage::Routing, nil] Allows you to customize which channel(s) Courier will potentially deliver the me
      #
      #   @param timeout [Courier::Models::BaseMessage::Timeout, nil] Time in ms to attempt the channel before failing over to the next available chan

      class Channel < Courier::Internal::Type::BaseModel
        # @!attribute brand_id
        #   Id of the brand that should be used for rendering the message. If not specified,
        #   the brand configured as default brand will be used.
        #
        #   @return [String, nil]
        optional :brand_id, String, nil?: true

        # @!attribute if_
        #   A JavaScript conditional expression to determine if the message should be sent
        #   through the channel. Has access to the data and profile object. Only applies
        #   when a custom routing strategy is defined. For example,
        #   `data.name === profile.name`.
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::BaseMessage::Channel::Metadata, nil]
        optional :metadata, -> { Courier::BaseMessage::Channel::Metadata }, nil?: true

        # @!attribute override
        #   Channel specific overrides.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute providers
        #   A list of providers enabled for this channel. Courier will select one provider
        #   to send through unless routing_method is set to all.
        #
        #   @return [Array<String>, nil]
        optional :providers, Courier::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute routing_method
        #   The method for selecting the providers to send the message with. Single will
        #   send to one of the available providers for this channel, all will send the
        #   message through all channels. Defaults to `single`.
        #
        #   @return [Symbol, Courier::Models::BaseMessage::Channel::RoutingMethod, nil]
        optional :routing_method, enum: -> { Courier::BaseMessage::Channel::RoutingMethod }, nil?: true

        # @!attribute timeouts
        #
        #   @return [Courier::Models::BaseMessage::Channel::Timeouts, nil]
        optional :timeouts, -> { Courier::BaseMessage::Channel::Timeouts }, nil?: true

        # @!method initialize(brand_id: nil, if_: nil, metadata: nil, override: nil, providers: nil, routing_method: nil, timeouts: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Channel} for more details.
        #
        #   @param brand_id [String, nil] Id of the brand that should be used for rendering the message.
        #
        #   @param if_ [String, nil] A JavaScript conditional expression to determine if the message should be sent
        #
        #   @param metadata [Courier::Models::BaseMessage::Channel::Metadata, nil]
        #
        #   @param override [Hash{Symbol=>Object}, nil] Channel specific overrides.
        #
        #   @param providers [Array<String>, nil] A list of providers enabled for this channel. Courier will select
        #
        #   @param routing_method [Symbol, Courier::Models::BaseMessage::Channel::RoutingMethod, nil] The method for selecting the providers to send the message with.
        #
        #   @param timeouts [Courier::Models::BaseMessage::Channel::Timeouts, nil]

        # @see Courier::Models::BaseMessage::Channel#metadata
        class Metadata < Courier::Internal::Type::BaseModel
          # @!attribute utm
          #
          #   @return [Courier::Models::Utm, nil]
          optional :utm, -> { Courier::Utm }, nil?: true

          # @!method initialize(utm: nil)
          #   @param utm [Courier::Models::Utm, nil]
        end

        # The method for selecting the providers to send the message with. Single will
        # send to one of the available providers for this channel, all will send the
        # message through all channels. Defaults to `single`.
        #
        # @see Courier::Models::BaseMessage::Channel#routing_method
        module RoutingMethod
          extend Courier::Internal::Type::Enum

          ALL = :all
          SINGLE = :single

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::BaseMessage::Channel#timeouts
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

      # @see Courier::Models::BaseMessage#delay
      class Delay < Courier::Internal::Type::BaseModel
        # @!attribute duration
        #   The duration of the delay in milliseconds.
        #
        #   @return [Integer, nil]
        optional :duration, Integer, nil?: true

        # @!attribute until_
        #   An ISO 8601 timestamp that specifies when it should be delivered or an
        #   OpenStreetMap opening_hours-like format that specifies the
        #   [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
        #   (e.g., 'Mo-Fr 08:00-18:00pm')
        #
        #   @return [String, nil]
        optional :until_, String, api_name: :until, nil?: true

        # @!method initialize(duration: nil, until_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Delay} for more details.
        #
        #   Defines the time to wait before delivering the message. You can specify one of
        #   the following options. Duration with the number of milliseconds to delay. Until
        #   with an ISO 8601 timestamp that specifies when it should be delivered. Until
        #   with an OpenStreetMap opening_hours-like format that specifies the
        #   [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
        #   (e.g., 'Mo-Fr 08:00-18:00pm')
        #
        #   @param duration [Integer, nil] The duration of the delay in milliseconds.
        #
        #   @param until_ [String, nil] An ISO 8601 timestamp that specifies when it should be delivered or an OpenStree
      end

      # @see Courier::Models::BaseMessage#expiry
      class Expiry < Courier::Internal::Type::BaseModel
        # @!attribute expires_in
        #   A duration in the form of milliseconds or an ISO8601 Duration format (i.e.
        #   P1DT4H).
        #
        #   @return [String, Integer]
        required :expires_in, union: -> { Courier::BaseMessage::Expiry::ExpiresIn }

        # @!attribute expires_at
        #   An epoch timestamp or ISO8601 timestamp with timezone
        #   `(YYYY-MM-DDThh:mm:ss.sTZD)` that describes the time in which a message expires.
        #
        #   @return [String, nil]
        optional :expires_at, String, nil?: true

        # @!method initialize(expires_in:, expires_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Expiry} for more details.
        #
        #   "Expiry allows you to set an absolute or relative time in which a message
        #   expires. Note: This is only valid for the Courier Inbox channel as of
        #   12-08-2022."
        #
        #   @param expires_in [String, Integer] A duration in the form of milliseconds or an ISO8601 Duration format (i.e. P1DT4
        #
        #   @param expires_at [String, nil] An epoch timestamp or ISO8601 timestamp with timezone `(YYYY-MM-DDThh:mm:ss.sTZD

        # A duration in the form of milliseconds or an ISO8601 Duration format (i.e.
        # P1DT4H).
        #
        # @see Courier::Models::BaseMessage::Expiry#expires_in
        module ExpiresIn
          extend Courier::Internal::Type::Union

          variant String

          variant Integer

          # @!method self.variants
          #   @return [Array(String, Integer)]
        end
      end

      # @see Courier::Models::BaseMessage#metadata
      class Metadata < Courier::Internal::Type::BaseModel
        # @!attribute event
        #   An arbitrary string to tracks the event that generated this request (e.g.
        #   'signup').
        #
        #   @return [String, nil]
        optional :event, String, nil?: true

        # @!attribute tags
        #   An array of up to 9 tags you wish to associate with this request (and
        #   corresponding messages) for later analysis. Individual tags cannot be more than
        #   30 characters in length.
        #
        #   @return [Array<String>, nil]
        optional :tags, Courier::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute trace_id
        #   A unique ID used to correlate this request to processing on your servers. Note:
        #   Courier does not verify the uniqueness of this ID.
        #
        #   @return [String, nil]
        optional :trace_id, String, nil?: true

        # @!attribute utm
        #   Identify the campaign that refers traffic to a specific website, and attributes
        #   the browser's website session.
        #
        #   @return [Courier::Models::Utm, nil]
        optional :utm, -> { Courier::Utm }, nil?: true

        # @!method initialize(event: nil, tags: nil, trace_id: nil, utm: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Metadata} for more details.
        #
        #   Metadata such as utm tracking attached with the notification through this
        #   channel.
        #
        #   @param event [String, nil] An arbitrary string to tracks the event that generated this request (e.g. 'signu
        #
        #   @param tags [Array<String>, nil] An array of up to 9 tags you wish to associate with this request (and correspond
        #
        #   @param trace_id [String, nil] A unique ID used to correlate this request to processing on your servers. Note:
        #
        #   @param utm [Courier::Models::Utm, nil] Identify the campaign that refers traffic to a specific website, and attributes
      end

      # @see Courier::Models::BaseMessage#preferences
      class Preferences < Courier::Internal::Type::BaseModel
        # @!attribute subscription_topic_id
        #   The ID of the subscription topic you want to apply to the message. If this is a
        #   templated message, it will override the subscription topic if already associated
        #
        #   @return [String]
        required :subscription_topic_id, String

        # @!method initialize(subscription_topic_id:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Preferences} for more details.
        #
        #   @param subscription_topic_id [String] The ID of the subscription topic you want to apply to the message. If this is a
      end

      class Provider < Courier::Internal::Type::BaseModel
        # @!attribute if_
        #   A JavaScript conditional expression to determine if the message should be sent
        #   through the provider. Has access to the data and profile object. Only applies
        #   when a custom routing strategy is defined. For example,
        #   `data.name === profile.name`
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute metadata
        #
        #   @return [Courier::Models::BaseMessage::Provider::Metadata, nil]
        optional :metadata, -> { Courier::BaseMessage::Provider::Metadata }, nil?: true

        # @!attribute override
        #   Provider specific overrides.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :override, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

        # @!attribute timeouts
        #
        #   @return [Integer, nil]
        optional :timeouts, Integer, nil?: true

        # @!method initialize(if_: nil, metadata: nil, override: nil, timeouts: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Provider} for more details.
        #
        #   @param if_ [String, nil] A JavaScript conditional expression to determine if the message should be sent t
        #
        #   @param metadata [Courier::Models::BaseMessage::Provider::Metadata, nil]
        #
        #   @param override [Hash{Symbol=>Object}, nil] Provider specific overrides.
        #
        #   @param timeouts [Integer, nil]

        # @see Courier::Models::BaseMessage::Provider#metadata
        class Metadata < Courier::Internal::Type::BaseModel
          # @!attribute utm
          #
          #   @return [Courier::Models::Utm, nil]
          optional :utm, -> { Courier::Utm }, nil?: true

          # @!method initialize(utm: nil)
          #   @param utm [Courier::Models::Utm, nil]
        end
      end

      # @see Courier::Models::BaseMessage#routing
      class Routing < Courier::Internal::Type::BaseModel
        # @!attribute channels
        #   A list of channels or providers to send the message through. Can also
        #   recursively define sub-routing methods, which can be useful for defining
        #   advanced push notification delivery strategies.
        #
        #   @return [Array<String, Courier::Models::MessageRouting>]
        required :channels, -> { Courier::Internal::Type::ArrayOf[union: Courier::MessageRoutingChannel] }

        # @!attribute method_
        #
        #   @return [Symbol, Courier::Models::BaseMessage::Routing::Method]
        required :method_, enum: -> { Courier::BaseMessage::Routing::Method }, api_name: :method

        # @!method initialize(channels:, method_:)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::BaseMessage::Routing} for more details.
        #
        #   Allows you to customize which channel(s) Courier will potentially deliver the
        #   message. If no routing key is specified, Courier will use the default routing
        #   configuration or routing defined by the template.
        #
        #   @param channels [Array<String, Courier::Models::MessageRouting>] A list of channels or providers to send the message through. Can also recursivel
        #
        #   @param method_ [Symbol, Courier::Models::BaseMessage::Routing::Method]

        # @see Courier::Models::BaseMessage::Routing#method_
        module Method
          extend Courier::Internal::Type::Enum

          ALL = :all
          SINGLE = :single

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Courier::Models::BaseMessage#timeout
      class Timeout < Courier::Internal::Type::BaseModel
        # @!attribute channel
        #
        #   @return [Hash{Symbol=>Integer}, nil]
        optional :channel, Courier::Internal::Type::HashOf[Integer], nil?: true

        # @!attribute criteria
        #
        #   @return [Symbol, Courier::Models::BaseMessage::Timeout::Criteria, nil]
        optional :criteria, enum: -> { Courier::BaseMessage::Timeout::Criteria }, nil?: true

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
        #   Time in ms to attempt the channel before failing over to the next available
        #   channel.
        #
        #   @param channel [Hash{Symbol=>Integer}, nil]
        #   @param criteria [Symbol, Courier::Models::BaseMessage::Timeout::Criteria, nil]
        #   @param escalation [Integer, nil]
        #   @param message [Integer, nil]
        #   @param provider [Hash{Symbol=>Integer}, nil]

        # @see Courier::Models::BaseMessage::Timeout#criteria
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
    end
  end
end

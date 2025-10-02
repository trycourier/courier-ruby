# typed: strong

module Courier
  module Models
    class BaseMessage < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::BaseMessage, Courier::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_accessor :brand_id

      # "Define run-time configuration for one or more channels. If you don't specify
      # channels, the default configuration for each channel will be used. Valid
      # ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
      sig { returns(T.nilable(T::Hash[Symbol, Courier::BaseMessage::Channel])) }
      attr_accessor :channels

      # Context to load with this recipient. Will override any context set on
      # message.context.
      sig { returns(T.nilable(Courier::MessageContext)) }
      attr_reader :context

      sig { params(context: T.nilable(Courier::MessageContext::OrHash)).void }
      attr_writer :context

      # An arbitrary object that includes any data you want to pass to the message. The
      # data will populate the corresponding template or elements variables.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :data

      # Defines the time to wait before delivering the message. You can specify one of
      # the following options. Duration with the number of milliseconds to delay. Until
      # with an ISO 8601 timestamp that specifies when it should be delivered. Until
      # with an OpenStreetMap opening_hours-like format that specifies the
      # [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
      # (e.g., 'Mo-Fr 08:00-18:00pm')
      sig { returns(T.nilable(Courier::BaseMessage::Delay)) }
      attr_reader :delay

      sig { params(delay: T.nilable(Courier::BaseMessage::Delay::OrHash)).void }
      attr_writer :delay

      # "Expiry allows you to set an absolute or relative time in which a message
      # expires. Note: This is only valid for the Courier Inbox channel as of
      # 12-08-2022."
      sig { returns(T.nilable(Courier::BaseMessage::Expiry)) }
      attr_reader :expiry

      sig do
        params(expiry: T.nilable(Courier::BaseMessage::Expiry::OrHash)).void
      end
      attr_writer :expiry

      # Metadata such as utm tracking attached with the notification through this
      # channel.
      sig { returns(T.nilable(Courier::BaseMessage::Metadata)) }
      attr_reader :metadata

      sig do
        params(metadata: T.nilable(Courier::BaseMessage::Metadata::OrHash)).void
      end
      attr_writer :metadata

      sig { returns(T.nilable(Courier::BaseMessage::Preferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::BaseMessage::Preferences::OrHash)
        ).void
      end
      attr_writer :preferences

      # An object whose keys are valid provider identifiers which map to an object.
      sig do
        returns(T.nilable(T::Hash[Symbol, Courier::BaseMessage::Provider]))
      end
      attr_accessor :providers

      # Allows you to customize which channel(s) Courier will potentially deliver the
      # message. If no routing key is specified, Courier will use the default routing
      # configuration or routing defined by the template.
      sig { returns(T.nilable(Courier::BaseMessage::Routing)) }
      attr_reader :routing

      sig do
        params(routing: T.nilable(Courier::BaseMessage::Routing::OrHash)).void
      end
      attr_writer :routing

      # Time in ms to attempt the channel before failing over to the next available
      # channel.
      sig { returns(T.nilable(Courier::BaseMessage::Timeout)) }
      attr_reader :timeout

      sig do
        params(timeout: T.nilable(Courier::BaseMessage::Timeout::OrHash)).void
      end
      attr_writer :timeout

      sig do
        params(
          brand_id: T.nilable(String),
          channels:
            T.nilable(T::Hash[Symbol, Courier::BaseMessage::Channel::OrHash]),
          context: T.nilable(Courier::MessageContext::OrHash),
          data: T.nilable(T::Hash[Symbol, T.anything]),
          delay: T.nilable(Courier::BaseMessage::Delay::OrHash),
          expiry: T.nilable(Courier::BaseMessage::Expiry::OrHash),
          metadata: T.nilable(Courier::BaseMessage::Metadata::OrHash),
          preferences: T.nilable(Courier::BaseMessage::Preferences::OrHash),
          providers:
            T.nilable(T::Hash[Symbol, Courier::BaseMessage::Provider::OrHash]),
          routing: T.nilable(Courier::BaseMessage::Routing::OrHash),
          timeout: T.nilable(Courier::BaseMessage::Timeout::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        brand_id: nil,
        # "Define run-time configuration for one or more channels. If you don't specify
        # channels, the default configuration for each channel will be used. Valid
        # ChannelId's are: email, sms, push, inbox, direct_message, banner, and webhook."
        channels: nil,
        # Context to load with this recipient. Will override any context set on
        # message.context.
        context: nil,
        # An arbitrary object that includes any data you want to pass to the message. The
        # data will populate the corresponding template or elements variables.
        data: nil,
        # Defines the time to wait before delivering the message. You can specify one of
        # the following options. Duration with the number of milliseconds to delay. Until
        # with an ISO 8601 timestamp that specifies when it should be delivered. Until
        # with an OpenStreetMap opening_hours-like format that specifies the
        # [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
        # (e.g., 'Mo-Fr 08:00-18:00pm')
        delay: nil,
        # "Expiry allows you to set an absolute or relative time in which a message
        # expires. Note: This is only valid for the Courier Inbox channel as of
        # 12-08-2022."
        expiry: nil,
        # Metadata such as utm tracking attached with the notification through this
        # channel.
        metadata: nil,
        preferences: nil,
        # An object whose keys are valid provider identifiers which map to an object.
        providers: nil,
        # Allows you to customize which channel(s) Courier will potentially deliver the
        # message. If no routing key is specified, Courier will use the default routing
        # configuration or routing defined by the template.
        routing: nil,
        # Time in ms to attempt the channel before failing over to the next available
        # channel.
        timeout: nil
      )
      end

      sig do
        override.returns(
          {
            brand_id: T.nilable(String),
            channels: T.nilable(T::Hash[Symbol, Courier::BaseMessage::Channel]),
            context: T.nilable(Courier::MessageContext),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            delay: T.nilable(Courier::BaseMessage::Delay),
            expiry: T.nilable(Courier::BaseMessage::Expiry),
            metadata: T.nilable(Courier::BaseMessage::Metadata),
            preferences: T.nilable(Courier::BaseMessage::Preferences),
            providers:
              T.nilable(T::Hash[Symbol, Courier::BaseMessage::Provider]),
            routing: T.nilable(Courier::BaseMessage::Routing),
            timeout: T.nilable(Courier::BaseMessage::Timeout)
          }
        )
      end
      def to_hash
      end

      class Channel < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Channel, Courier::Internal::AnyHash)
          end

        # Id of the brand that should be used for rendering the message. If not specified,
        # the brand configured as default brand will be used.
        sig { returns(T.nilable(String)) }
        attr_accessor :brand_id

        # A JavaScript conditional expression to determine if the message should be sent
        # through the channel. Has access to the data and profile object. Only applies
        # when a custom routing strategy is defined. For example,
        # `data.name === profile.name`.
        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(Courier::BaseMessage::Channel::Metadata)) }
        attr_reader :metadata

        sig do
          params(
            metadata: T.nilable(Courier::BaseMessage::Channel::Metadata::OrHash)
          ).void
        end
        attr_writer :metadata

        # Channel specific overrides.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :override

        # A list of providers enabled for this channel. Courier will select one provider
        # to send through unless routing_method is set to all.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :providers

        # The method for selecting the providers to send the message with. Single will
        # send to one of the available providers for this channel, all will send the
        # message through all channels. Defaults to `single`.
        sig do
          returns(
            T.nilable(Courier::BaseMessage::Channel::RoutingMethod::OrSymbol)
          )
        end
        attr_accessor :routing_method

        sig { returns(T.nilable(Courier::BaseMessage::Channel::Timeouts)) }
        attr_reader :timeouts

        sig do
          params(
            timeouts: T.nilable(Courier::BaseMessage::Channel::Timeouts::OrHash)
          ).void
        end
        attr_writer :timeouts

        sig do
          params(
            brand_id: T.nilable(String),
            if_: T.nilable(String),
            metadata:
              T.nilable(Courier::BaseMessage::Channel::Metadata::OrHash),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            providers: T.nilable(T::Array[String]),
            routing_method:
              T.nilable(Courier::BaseMessage::Channel::RoutingMethod::OrSymbol),
            timeouts: T.nilable(Courier::BaseMessage::Channel::Timeouts::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Id of the brand that should be used for rendering the message. If not specified,
          # the brand configured as default brand will be used.
          brand_id: nil,
          # A JavaScript conditional expression to determine if the message should be sent
          # through the channel. Has access to the data and profile object. Only applies
          # when a custom routing strategy is defined. For example,
          # `data.name === profile.name`.
          if_: nil,
          metadata: nil,
          # Channel specific overrides.
          override: nil,
          # A list of providers enabled for this channel. Courier will select one provider
          # to send through unless routing_method is set to all.
          providers: nil,
          # The method for selecting the providers to send the message with. Single will
          # send to one of the available providers for this channel, all will send the
          # message through all channels. Defaults to `single`.
          routing_method: nil,
          timeouts: nil
        )
        end

        sig do
          override.returns(
            {
              brand_id: T.nilable(String),
              if_: T.nilable(String),
              metadata: T.nilable(Courier::BaseMessage::Channel::Metadata),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              providers: T.nilable(T::Array[String]),
              routing_method:
                T.nilable(
                  Courier::BaseMessage::Channel::RoutingMethod::OrSymbol
                ),
              timeouts: T.nilable(Courier::BaseMessage::Channel::Timeouts)
            }
          )
        end
        def to_hash
        end

        class Metadata < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BaseMessage::Channel::Metadata,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(T.nilable(Courier::BaseMessage::Channel::Metadata::Utm))
          end
          attr_reader :utm

          sig do
            params(
              utm:
                T.nilable(Courier::BaseMessage::Channel::Metadata::Utm::OrHash)
            ).void
          end
          attr_writer :utm

          sig do
            params(
              utm:
                T.nilable(Courier::BaseMessage::Channel::Metadata::Utm::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(utm: nil)
          end

          sig do
            override.returns(
              { utm: T.nilable(Courier::BaseMessage::Channel::Metadata::Utm) }
            )
          end
          def to_hash
          end

          class Utm < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::BaseMessage::Channel::Metadata::Utm,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :campaign

            sig { returns(T.nilable(String)) }
            attr_accessor :content

            sig { returns(T.nilable(String)) }
            attr_accessor :medium

            sig { returns(T.nilable(String)) }
            attr_accessor :source

            sig { returns(T.nilable(String)) }
            attr_accessor :term

            sig do
              params(
                campaign: T.nilable(String),
                content: T.nilable(String),
                medium: T.nilable(String),
                source: T.nilable(String),
                term: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              campaign: nil,
              content: nil,
              medium: nil,
              source: nil,
              term: nil
            )
            end

            sig do
              override.returns(
                {
                  campaign: T.nilable(String),
                  content: T.nilable(String),
                  medium: T.nilable(String),
                  source: T.nilable(String),
                  term: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end

        # The method for selecting the providers to send the message with. Single will
        # send to one of the available providers for this channel, all will send the
        # message through all channels. Defaults to `single`.
        module RoutingMethod
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::BaseMessage::Channel::RoutingMethod)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Courier::BaseMessage::Channel::RoutingMethod::TaggedSymbol
            )
          SINGLE =
            T.let(
              :single,
              Courier::BaseMessage::Channel::RoutingMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::BaseMessage::Channel::RoutingMethod::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Timeouts < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BaseMessage::Channel::Timeouts,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :channel

          sig { returns(T.nilable(Integer)) }
          attr_accessor :provider

          sig do
            params(
              channel: T.nilable(Integer),
              provider: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(channel: nil, provider: nil)
          end

          sig do
            override.returns(
              { channel: T.nilable(Integer), provider: T.nilable(Integer) }
            )
          end
          def to_hash
          end
        end
      end

      class Delay < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Delay, Courier::Internal::AnyHash)
          end

        # The duration of the delay in milliseconds.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :duration

        # An ISO 8601 timestamp that specifies when it should be delivered or an
        # OpenStreetMap opening_hours-like format that specifies the
        # [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
        # (e.g., 'Mo-Fr 08:00-18:00pm')
        sig { returns(T.nilable(String)) }
        attr_accessor :until_

        # Defines the time to wait before delivering the message. You can specify one of
        # the following options. Duration with the number of milliseconds to delay. Until
        # with an ISO 8601 timestamp that specifies when it should be delivered. Until
        # with an OpenStreetMap opening_hours-like format that specifies the
        # [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
        # (e.g., 'Mo-Fr 08:00-18:00pm')
        sig do
          params(
            duration: T.nilable(Integer),
            until_: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The duration of the delay in milliseconds.
          duration: nil,
          # An ISO 8601 timestamp that specifies when it should be delivered or an
          # OpenStreetMap opening_hours-like format that specifies the
          # [Delivery Window](https://www.courier.com/docs/platform/sending/failover/#delivery-window)
          # (e.g., 'Mo-Fr 08:00-18:00pm')
          until_: nil
        )
        end

        sig do
          override.returns(
            { duration: T.nilable(Integer), until_: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Expiry < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Expiry, Courier::Internal::AnyHash)
          end

        # A duration in the form of milliseconds or an ISO8601 Duration format (i.e.
        # P1DT4H).
        sig { returns(Courier::BaseMessage::Expiry::ExpiresIn::Variants) }
        attr_accessor :expires_in

        # An epoch timestamp or ISO8601 timestamp with timezone
        # `(YYYY-MM-DDThh:mm:ss.sTZD)` that describes the time in which a message expires.
        sig { returns(T.nilable(String)) }
        attr_accessor :expires_at

        # "Expiry allows you to set an absolute or relative time in which a message
        # expires. Note: This is only valid for the Courier Inbox channel as of
        # 12-08-2022."
        sig do
          params(
            expires_in: Courier::BaseMessage::Expiry::ExpiresIn::Variants,
            expires_at: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # A duration in the form of milliseconds or an ISO8601 Duration format (i.e.
          # P1DT4H).
          expires_in:,
          # An epoch timestamp or ISO8601 timestamp with timezone
          # `(YYYY-MM-DDThh:mm:ss.sTZD)` that describes the time in which a message expires.
          expires_at: nil
        )
        end

        sig do
          override.returns(
            {
              expires_in: Courier::BaseMessage::Expiry::ExpiresIn::Variants,
              expires_at: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # A duration in the form of milliseconds or an ISO8601 Duration format (i.e.
        # P1DT4H).
        module ExpiresIn
          extend Courier::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Integer) }

          sig do
            override.returns(
              T::Array[Courier::BaseMessage::Expiry::ExpiresIn::Variants]
            )
          end
          def self.variants
          end
        end
      end

      class Metadata < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Metadata, Courier::Internal::AnyHash)
          end

        # An arbitrary string to tracks the event that generated this request (e.g.
        # 'signup').
        sig { returns(T.nilable(String)) }
        attr_accessor :event

        # An array of up to 9 tags you wish to associate with this request (and
        # corresponding messages) for later analysis. Individual tags cannot be more than
        # 30 characters in length.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :tags

        # A unique ID used to correlate this request to processing on your servers. Note:
        # Courier does not verify the uniqueness of this ID.
        sig { returns(T.nilable(String)) }
        attr_accessor :trace_id

        # Identify the campaign that refers traffic to a specific website, and attributes
        # the browser's website session.
        sig { returns(T.nilable(Courier::BaseMessage::Metadata::Utm)) }
        attr_reader :utm

        sig do
          params(
            utm: T.nilable(Courier::BaseMessage::Metadata::Utm::OrHash)
          ).void
        end
        attr_writer :utm

        # Metadata such as utm tracking attached with the notification through this
        # channel.
        sig do
          params(
            event: T.nilable(String),
            tags: T.nilable(T::Array[String]),
            trace_id: T.nilable(String),
            utm: T.nilable(Courier::BaseMessage::Metadata::Utm::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # An arbitrary string to tracks the event that generated this request (e.g.
          # 'signup').
          event: nil,
          # An array of up to 9 tags you wish to associate with this request (and
          # corresponding messages) for later analysis. Individual tags cannot be more than
          # 30 characters in length.
          tags: nil,
          # A unique ID used to correlate this request to processing on your servers. Note:
          # Courier does not verify the uniqueness of this ID.
          trace_id: nil,
          # Identify the campaign that refers traffic to a specific website, and attributes
          # the browser's website session.
          utm: nil
        )
        end

        sig do
          override.returns(
            {
              event: T.nilable(String),
              tags: T.nilable(T::Array[String]),
              trace_id: T.nilable(String),
              utm: T.nilable(Courier::BaseMessage::Metadata::Utm)
            }
          )
        end
        def to_hash
        end

        class Utm < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BaseMessage::Metadata::Utm,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :campaign

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig { returns(T.nilable(String)) }
          attr_accessor :medium

          sig { returns(T.nilable(String)) }
          attr_accessor :source

          sig { returns(T.nilable(String)) }
          attr_accessor :term

          # Identify the campaign that refers traffic to a specific website, and attributes
          # the browser's website session.
          sig do
            params(
              campaign: T.nilable(String),
              content: T.nilable(String),
              medium: T.nilable(String),
              source: T.nilable(String),
              term: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            campaign: nil,
            content: nil,
            medium: nil,
            source: nil,
            term: nil
          )
          end

          sig do
            override.returns(
              {
                campaign: T.nilable(String),
                content: T.nilable(String),
                medium: T.nilable(String),
                source: T.nilable(String),
                term: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      class Preferences < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Preferences, Courier::Internal::AnyHash)
          end

        # The ID of the subscription topic you want to apply to the message. If this is a
        # templated message, it will override the subscription topic if already associated
        sig { returns(String) }
        attr_accessor :subscription_topic_id

        sig { params(subscription_topic_id: String).returns(T.attached_class) }
        def self.new(
          # The ID of the subscription topic you want to apply to the message. If this is a
          # templated message, it will override the subscription topic if already associated
          subscription_topic_id:
        )
        end

        sig { override.returns({ subscription_topic_id: String }) }
        def to_hash
        end
      end

      class Provider < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Provider, Courier::Internal::AnyHash)
          end

        # A JavaScript conditional expression to determine if the message should be sent
        # through the provider. Has access to the data and profile object. Only applies
        # when a custom routing strategy is defined. For example,
        # `data.name === profile.name`
        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig { returns(T.nilable(Courier::BaseMessage::Provider::Metadata)) }
        attr_reader :metadata

        sig do
          params(
            metadata:
              T.nilable(Courier::BaseMessage::Provider::Metadata::OrHash)
          ).void
        end
        attr_writer :metadata

        # Provider specific overrides.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :override

        sig { returns(T.nilable(Integer)) }
        attr_accessor :timeouts

        sig do
          params(
            if_: T.nilable(String),
            metadata:
              T.nilable(Courier::BaseMessage::Provider::Metadata::OrHash),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            timeouts: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # A JavaScript conditional expression to determine if the message should be sent
          # through the provider. Has access to the data and profile object. Only applies
          # when a custom routing strategy is defined. For example,
          # `data.name === profile.name`
          if_: nil,
          metadata: nil,
          # Provider specific overrides.
          override: nil,
          timeouts: nil
        )
        end

        sig do
          override.returns(
            {
              if_: T.nilable(String),
              metadata: T.nilable(Courier::BaseMessage::Provider::Metadata),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              timeouts: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end

        class Metadata < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BaseMessage::Provider::Metadata,
                Courier::Internal::AnyHash
              )
            end

          sig do
            returns(T.nilable(Courier::BaseMessage::Provider::Metadata::Utm))
          end
          attr_reader :utm

          sig do
            params(
              utm:
                T.nilable(Courier::BaseMessage::Provider::Metadata::Utm::OrHash)
            ).void
          end
          attr_writer :utm

          sig do
            params(
              utm:
                T.nilable(Courier::BaseMessage::Provider::Metadata::Utm::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(utm: nil)
          end

          sig do
            override.returns(
              { utm: T.nilable(Courier::BaseMessage::Provider::Metadata::Utm) }
            )
          end
          def to_hash
          end

          class Utm < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::BaseMessage::Provider::Metadata::Utm,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :campaign

            sig { returns(T.nilable(String)) }
            attr_accessor :content

            sig { returns(T.nilable(String)) }
            attr_accessor :medium

            sig { returns(T.nilable(String)) }
            attr_accessor :source

            sig { returns(T.nilable(String)) }
            attr_accessor :term

            sig do
              params(
                campaign: T.nilable(String),
                content: T.nilable(String),
                medium: T.nilable(String),
                source: T.nilable(String),
                term: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              campaign: nil,
              content: nil,
              medium: nil,
              source: nil,
              term: nil
            )
            end

            sig do
              override.returns(
                {
                  campaign: T.nilable(String),
                  content: T.nilable(String),
                  medium: T.nilable(String),
                  source: T.nilable(String),
                  term: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class Routing < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Routing, Courier::Internal::AnyHash)
          end

        # A list of channels or providers to send the message through. Can also
        # recursively define sub-routing methods, which can be useful for defining
        # advanced push notification delivery strategies.
        sig { returns(T::Array[T.any(String, Courier::MessageRouting)]) }
        attr_accessor :channels

        sig { returns(Courier::BaseMessage::Routing::Method::OrSymbol) }
        attr_accessor :method_

        # Allows you to customize which channel(s) Courier will potentially deliver the
        # message. If no routing key is specified, Courier will use the default routing
        # configuration or routing defined by the template.
        sig do
          params(
            channels: T::Array[T.any(String, Courier::MessageRouting)],
            method_: Courier::BaseMessage::Routing::Method::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A list of channels or providers to send the message through. Can also
          # recursively define sub-routing methods, which can be useful for defining
          # advanced push notification delivery strategies.
          channels:,
          method_:
        )
        end

        sig do
          override.returns(
            {
              channels: T::Array[T.any(String, Courier::MessageRouting)],
              method_: Courier::BaseMessage::Routing::Method::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Method
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::BaseMessage::Routing::Method)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL = T.let(:all, Courier::BaseMessage::Routing::Method::TaggedSymbol)
          SINGLE =
            T.let(:single, Courier::BaseMessage::Routing::Method::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Courier::BaseMessage::Routing::Method::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class Timeout < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BaseMessage::Timeout, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
        attr_accessor :channel

        sig do
          returns(T.nilable(Courier::BaseMessage::Timeout::Criteria::OrSymbol))
        end
        attr_accessor :criteria

        sig { returns(T.nilable(Integer)) }
        attr_accessor :escalation

        sig { returns(T.nilable(Integer)) }
        attr_accessor :message

        sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
        attr_accessor :provider

        # Time in ms to attempt the channel before failing over to the next available
        # channel.
        sig do
          params(
            channel: T.nilable(T::Hash[Symbol, Integer]),
            criteria:
              T.nilable(Courier::BaseMessage::Timeout::Criteria::OrSymbol),
            escalation: T.nilable(Integer),
            message: T.nilable(Integer),
            provider: T.nilable(T::Hash[Symbol, Integer])
          ).returns(T.attached_class)
        end
        def self.new(
          channel: nil,
          criteria: nil,
          escalation: nil,
          message: nil,
          provider: nil
        )
        end

        sig do
          override.returns(
            {
              channel: T.nilable(T::Hash[Symbol, Integer]),
              criteria:
                T.nilable(Courier::BaseMessage::Timeout::Criteria::OrSymbol),
              escalation: T.nilable(Integer),
              message: T.nilable(Integer),
              provider: T.nilable(T::Hash[Symbol, Integer])
            }
          )
        end
        def to_hash
        end

        module Criteria
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::BaseMessage::Timeout::Criteria)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NO_ESCALATION =
            T.let(
              :"no-escalation",
              Courier::BaseMessage::Timeout::Criteria::TaggedSymbol
            )
          DELIVERED =
            T.let(
              :delivered,
              Courier::BaseMessage::Timeout::Criteria::TaggedSymbol
            )
          VIEWED =
            T.let(
              :viewed,
              Courier::BaseMessage::Timeout::Criteria::TaggedSymbol
            )
          ENGAGED =
            T.let(
              :engaged,
              Courier::BaseMessage::Timeout::Criteria::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::BaseMessage::Timeout::Criteria::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

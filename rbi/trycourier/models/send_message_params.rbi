# typed: strong

module Trycourier
  module Models
    class SendMessageParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::SendMessageParams, Trycourier::Internal::AnyHash)
        end

      # The message property has the following primary top-level properties. They define
      # the destination and content of the message.
      sig { returns(Trycourier::SendMessageParams::Message) }
      attr_reader :message

      sig do
        params(message: Trycourier::SendMessageParams::Message::OrHash).void
      end
      attr_writer :message

      sig do
        params(
          message: Trycourier::SendMessageParams::Message::OrHash,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The message property has the following primary top-level properties. They define
        # the destination and content of the message.
        message:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            message: Trycourier::SendMessageParams::Message,
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Message < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::SendMessageParams::Message,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_id

        # Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        # inbox, direct_message, banner, webhook.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Trycourier::SendMessageParams::Message::Channel]
            )
          )
        end
        attr_accessor :channels

        # Describes content that will work for email, inbox, push, chat, or any channel
        # id.
        sig do
          returns(
            T.nilable(
              T.any(
                Trycourier::ElementalContentSugar,
                Trycourier::ElementalContent
              )
            )
          )
        end
        attr_reader :content

        sig do
          params(
            content:
              T.any(
                Trycourier::ElementalContentSugar::OrHash,
                Trycourier::ElementalContent::OrHash
              )
          ).void
        end
        attr_writer :content

        sig { returns(T.nilable(Trycourier::MessageContext)) }
        attr_reader :context

        sig do
          params(context: T.nilable(Trycourier::MessageContext::OrHash)).void
        end
        attr_writer :context

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig do
          returns(T.nilable(Trycourier::SendMessageParams::Message::Delay))
        end
        attr_reader :delay

        sig do
          params(
            delay:
              T.nilable(Trycourier::SendMessageParams::Message::Delay::OrHash)
          ).void
        end
        attr_writer :delay

        sig do
          returns(T.nilable(Trycourier::SendMessageParams::Message::Expiry))
        end
        attr_reader :expiry

        sig do
          params(
            expiry:
              T.nilable(Trycourier::SendMessageParams::Message::Expiry::OrHash)
          ).void
        end
        attr_writer :expiry

        sig do
          returns(T.nilable(Trycourier::SendMessageParams::Message::Metadata))
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              T.nilable(
                Trycourier::SendMessageParams::Message::Metadata::OrHash
              )
          ).void
        end
        attr_writer :metadata

        sig do
          returns(
            T.nilable(Trycourier::SendMessageParams::Message::Preferences)
          )
        end
        attr_reader :preferences

        sig do
          params(
            preferences:
              T.nilable(
                Trycourier::SendMessageParams::Message::Preferences::OrHash
              )
          ).void
        end
        attr_writer :preferences

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Trycourier::SendMessageParams::Message::Provider]
            )
          )
        end
        attr_accessor :providers

        # Customize which channels/providers Courier may deliver the message through.
        sig do
          returns(T.nilable(Trycourier::SendMessageParams::Message::Routing))
        end
        attr_reader :routing

        sig do
          params(
            routing:
              T.nilable(Trycourier::SendMessageParams::Message::Routing::OrHash)
          ).void
        end
        attr_writer :routing

        sig { returns(T.nilable(String)) }
        attr_accessor :template

        sig do
          returns(T.nilable(Trycourier::SendMessageParams::Message::Timeout))
        end
        attr_reader :timeout

        sig do
          params(
            timeout:
              T.nilable(Trycourier::SendMessageParams::Message::Timeout::OrHash)
          ).void
        end
        attr_writer :timeout

        # The recipient or a list of recipients of the message
        sig do
          returns(
            T.nilable(
              T.any(Trycourier::UserRecipient, T::Array[Trycourier::Recipient])
            )
          )
        end
        attr_accessor :to

        # The message property has the following primary top-level properties. They define
        # the destination and content of the message.
        sig do
          params(
            brand_id: T.nilable(String),
            channels:
              T.nilable(
                T::Hash[
                  Symbol,
                  Trycourier::SendMessageParams::Message::Channel::OrHash
                ]
              ),
            content:
              T.any(
                Trycourier::ElementalContentSugar::OrHash,
                Trycourier::ElementalContent::OrHash
              ),
            context: T.nilable(Trycourier::MessageContext::OrHash),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            delay:
              T.nilable(Trycourier::SendMessageParams::Message::Delay::OrHash),
            expiry:
              T.nilable(Trycourier::SendMessageParams::Message::Expiry::OrHash),
            metadata:
              T.nilable(
                Trycourier::SendMessageParams::Message::Metadata::OrHash
              ),
            preferences:
              T.nilable(
                Trycourier::SendMessageParams::Message::Preferences::OrHash
              ),
            providers:
              T.nilable(
                T::Hash[
                  Symbol,
                  Trycourier::SendMessageParams::Message::Provider::OrHash
                ]
              ),
            routing:
              T.nilable(
                Trycourier::SendMessageParams::Message::Routing::OrHash
              ),
            template: T.nilable(String),
            timeout:
              T.nilable(
                Trycourier::SendMessageParams::Message::Timeout::OrHash
              ),
            to:
              T.nilable(
                T.any(
                  Trycourier::UserRecipient::OrHash,
                  T::Array[Trycourier::Recipient::OrHash]
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          brand_id: nil,
          # Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
          # inbox, direct_message, banner, webhook.
          channels: nil,
          # Describes content that will work for email, inbox, push, chat, or any channel
          # id.
          content: nil,
          context: nil,
          data: nil,
          delay: nil,
          expiry: nil,
          metadata: nil,
          preferences: nil,
          providers: nil,
          # Customize which channels/providers Courier may deliver the message through.
          routing: nil,
          template: nil,
          timeout: nil,
          # The recipient or a list of recipients of the message
          to: nil
        )
        end

        sig do
          override.returns(
            {
              brand_id: T.nilable(String),
              channels:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Trycourier::SendMessageParams::Message::Channel
                  ]
                ),
              content:
                T.any(
                  Trycourier::ElementalContentSugar,
                  Trycourier::ElementalContent
                ),
              context: T.nilable(Trycourier::MessageContext),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              delay: T.nilable(Trycourier::SendMessageParams::Message::Delay),
              expiry: T.nilable(Trycourier::SendMessageParams::Message::Expiry),
              metadata:
                T.nilable(Trycourier::SendMessageParams::Message::Metadata),
              preferences:
                T.nilable(Trycourier::SendMessageParams::Message::Preferences),
              providers:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Trycourier::SendMessageParams::Message::Provider
                  ]
                ),
              routing:
                T.nilable(Trycourier::SendMessageParams::Message::Routing),
              template: T.nilable(String),
              timeout:
                T.nilable(Trycourier::SendMessageParams::Message::Timeout),
              to:
                T.nilable(
                  T.any(
                    Trycourier::UserRecipient,
                    T::Array[Trycourier::Recipient]
                  )
                )
            }
          )
        end
        def to_hash
        end

        class Channel < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Channel,
                Trycourier::Internal::AnyHash
              )
            end

          # Brand id used for rendering.
          sig { returns(T.nilable(String)) }
          attr_accessor :brand_id

          # JS conditional with access to data/profile.
          sig { returns(T.nilable(String)) }
          attr_accessor :if_

          sig do
            returns(
              T.nilable(
                Trycourier::SendMessageParams::Message::Channel::Metadata
              )
            )
          end
          attr_reader :metadata

          sig do
            params(
              metadata:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Channel::Metadata::OrHash
                )
            ).void
          end
          attr_writer :metadata

          # Channel specific overrides.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_accessor :override

          # Providers enabled for this channel.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :providers

          # Defaults to `single`.
          sig do
            returns(
              T.nilable(
                Trycourier::SendMessageParams::Message::Channel::RoutingMethod::OrSymbol
              )
            )
          end
          attr_accessor :routing_method

          sig do
            returns(
              T.nilable(
                Trycourier::SendMessageParams::Message::Channel::Timeouts
              )
            )
          end
          attr_reader :timeouts

          sig do
            params(
              timeouts:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Channel::Timeouts::OrHash
                )
            ).void
          end
          attr_writer :timeouts

          sig do
            params(
              brand_id: T.nilable(String),
              if_: T.nilable(String),
              metadata:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Channel::Metadata::OrHash
                ),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              providers: T.nilable(T::Array[String]),
              routing_method:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Channel::RoutingMethod::OrSymbol
                ),
              timeouts:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Channel::Timeouts::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Brand id used for rendering.
            brand_id: nil,
            # JS conditional with access to data/profile.
            if_: nil,
            metadata: nil,
            # Channel specific overrides.
            override: nil,
            # Providers enabled for this channel.
            providers: nil,
            # Defaults to `single`.
            routing_method: nil,
            timeouts: nil
          )
          end

          sig do
            override.returns(
              {
                brand_id: T.nilable(String),
                if_: T.nilable(String),
                metadata:
                  T.nilable(
                    Trycourier::SendMessageParams::Message::Channel::Metadata
                  ),
                override: T.nilable(T::Hash[Symbol, T.anything]),
                providers: T.nilable(T::Array[String]),
                routing_method:
                  T.nilable(
                    Trycourier::SendMessageParams::Message::Channel::RoutingMethod::OrSymbol
                  ),
                timeouts:
                  T.nilable(
                    Trycourier::SendMessageParams::Message::Channel::Timeouts
                  )
              }
            )
          end
          def to_hash
          end

          class Metadata < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::SendMessageParams::Message::Channel::Metadata,
                  Trycourier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Trycourier::Utm)) }
            attr_reader :utm

            sig { params(utm: T.nilable(Trycourier::Utm::OrHash)).void }
            attr_writer :utm

            sig do
              params(utm: T.nilable(Trycourier::Utm::OrHash)).returns(
                T.attached_class
              )
            end
            def self.new(utm: nil)
            end

            sig { override.returns({ utm: T.nilable(Trycourier::Utm) }) }
            def to_hash
            end
          end

          # Defaults to `single`.
          module RoutingMethod
            extend Trycourier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Trycourier::SendMessageParams::Message::Channel::RoutingMethod
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Trycourier::SendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
              )
            SINGLE =
              T.let(
                :single,
                Trycourier::SendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Trycourier::SendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Timeouts < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::SendMessageParams::Message::Channel::Timeouts,
                  Trycourier::Internal::AnyHash
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

        # Describes content that will work for email, inbox, push, chat, or any channel
        # id.
        module Content
          extend Trycourier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Trycourier::ElementalContentSugar,
                Trycourier::ElementalContent
              )
            end

          sig do
            override.returns(
              T::Array[
                Trycourier::SendMessageParams::Message::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end

        class Delay < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Delay,
                Trycourier::Internal::AnyHash
              )
            end

          # The duration of the delay in milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :duration

          # IANA timezone identifier (e.g., "America/Los_Angeles", "UTC"). Used when
          # resolving opening hours expressions. Takes precedence over user profile timezone
          # settings.
          sig { returns(T.nilable(String)) }
          attr_accessor :timezone

          # ISO 8601 timestamp or opening_hours-like format.
          sig { returns(T.nilable(String)) }
          attr_accessor :until_

          sig do
            params(
              duration: T.nilable(Integer),
              timezone: T.nilable(String),
              until_: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The duration of the delay in milliseconds.
            duration: nil,
            # IANA timezone identifier (e.g., "America/Los_Angeles", "UTC"). Used when
            # resolving opening hours expressions. Takes precedence over user profile timezone
            # settings.
            timezone: nil,
            # ISO 8601 timestamp or opening_hours-like format.
            until_: nil
          )
          end

          sig do
            override.returns(
              {
                duration: T.nilable(Integer),
                timezone: T.nilable(String),
                until_: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class Expiry < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Expiry,
                Trycourier::Internal::AnyHash
              )
            end

          # Duration in ms or ISO8601 duration (e.g. P1DT4H).
          sig do
            returns(
              Trycourier::SendMessageParams::Message::Expiry::ExpiresIn::Variants
            )
          end
          attr_accessor :expires_in

          # Epoch or ISO8601 timestamp with timezone.
          sig { returns(T.nilable(String)) }
          attr_accessor :expires_at

          sig do
            params(
              expires_in:
                Trycourier::SendMessageParams::Message::Expiry::ExpiresIn::Variants,
              expires_at: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Duration in ms or ISO8601 duration (e.g. P1DT4H).
            expires_in:,
            # Epoch or ISO8601 timestamp with timezone.
            expires_at: nil
          )
          end

          sig do
            override.returns(
              {
                expires_in:
                  Trycourier::SendMessageParams::Message::Expiry::ExpiresIn::Variants,
                expires_at: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Duration in ms or ISO8601 duration (e.g. P1DT4H).
          module ExpiresIn
            extend Trycourier::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Integer) }

            sig do
              override.returns(
                T::Array[
                  Trycourier::SendMessageParams::Message::Expiry::ExpiresIn::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class Metadata < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Metadata,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :event

          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :tags

          sig { returns(T.nilable(String)) }
          attr_accessor :trace_id

          sig { returns(T.nilable(Trycourier::Utm)) }
          attr_reader :utm

          sig { params(utm: T.nilable(Trycourier::Utm::OrHash)).void }
          attr_writer :utm

          sig do
            params(
              event: T.nilable(String),
              tags: T.nilable(T::Array[String]),
              trace_id: T.nilable(String),
              utm: T.nilable(Trycourier::Utm::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(event: nil, tags: nil, trace_id: nil, utm: nil)
          end

          sig do
            override.returns(
              {
                event: T.nilable(String),
                tags: T.nilable(T::Array[String]),
                trace_id: T.nilable(String),
                utm: T.nilable(Trycourier::Utm)
              }
            )
          end
          def to_hash
          end
        end

        class Preferences < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Preferences,
                Trycourier::Internal::AnyHash
              )
            end

          # The subscription topic to apply to the message.
          sig { returns(String) }
          attr_accessor :subscription_topic_id

          sig do
            params(subscription_topic_id: String).returns(T.attached_class)
          end
          def self.new(
            # The subscription topic to apply to the message.
            subscription_topic_id:
          )
          end

          sig { override.returns({ subscription_topic_id: String }) }
          def to_hash
          end
        end

        class Provider < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Provider,
                Trycourier::Internal::AnyHash
              )
            end

          # JS conditional with access to data/profile.
          sig { returns(T.nilable(String)) }
          attr_accessor :if_

          sig do
            returns(
              T.nilable(
                Trycourier::SendMessageParams::Message::Provider::Metadata
              )
            )
          end
          attr_reader :metadata

          sig do
            params(
              metadata:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Provider::Metadata::OrHash
                )
            ).void
          end
          attr_writer :metadata

          # Provider-specific overrides.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_accessor :override

          sig { returns(T.nilable(Integer)) }
          attr_accessor :timeouts

          sig do
            params(
              if_: T.nilable(String),
              metadata:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Provider::Metadata::OrHash
                ),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              timeouts: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # JS conditional with access to data/profile.
            if_: nil,
            metadata: nil,
            # Provider-specific overrides.
            override: nil,
            timeouts: nil
          )
          end

          sig do
            override.returns(
              {
                if_: T.nilable(String),
                metadata:
                  T.nilable(
                    Trycourier::SendMessageParams::Message::Provider::Metadata
                  ),
                override: T.nilable(T::Hash[Symbol, T.anything]),
                timeouts: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          class Metadata < Trycourier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Trycourier::SendMessageParams::Message::Provider::Metadata,
                  Trycourier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Trycourier::Utm)) }
            attr_reader :utm

            sig { params(utm: T.nilable(Trycourier::Utm::OrHash)).void }
            attr_writer :utm

            sig do
              params(utm: T.nilable(Trycourier::Utm::OrHash)).returns(
                T.attached_class
              )
            end
            def self.new(utm: nil)
            end

            sig { override.returns({ utm: T.nilable(Trycourier::Utm) }) }
            def to_hash
            end
          end
        end

        class Routing < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Routing,
                Trycourier::Internal::AnyHash
              )
            end

          # A list of channels or providers (or nested routing rules).
          sig { returns(T::Array[T.any(String, Trycourier::MessageRouting)]) }
          attr_accessor :channels

          sig do
            returns(
              Trycourier::SendMessageParams::Message::Routing::Method::OrSymbol
            )
          end
          attr_accessor :method_

          # Customize which channels/providers Courier may deliver the message through.
          sig do
            params(
              channels: T::Array[T.any(String, Trycourier::MessageRouting)],
              method_:
                Trycourier::SendMessageParams::Message::Routing::Method::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # A list of channels or providers (or nested routing rules).
            channels:,
            method_:
          )
          end

          sig do
            override.returns(
              {
                channels: T::Array[T.any(String, Trycourier::MessageRouting)],
                method_:
                  Trycourier::SendMessageParams::Message::Routing::Method::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Method
            extend Trycourier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Trycourier::SendMessageParams::Message::Routing::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Trycourier::SendMessageParams::Message::Routing::Method::TaggedSymbol
              )
            SINGLE =
              T.let(
                :single,
                Trycourier::SendMessageParams::Message::Routing::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Trycourier::SendMessageParams::Message::Routing::Method::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Timeout < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::SendMessageParams::Message::Timeout,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
          attr_accessor :channel

          sig do
            returns(
              T.nilable(
                Trycourier::SendMessageParams::Message::Timeout::Criteria::OrSymbol
              )
            )
          end
          attr_accessor :criteria

          sig { returns(T.nilable(Integer)) }
          attr_accessor :escalation

          sig { returns(T.nilable(Integer)) }
          attr_accessor :message

          sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
          attr_accessor :provider

          sig do
            params(
              channel: T.nilable(T::Hash[Symbol, Integer]),
              criteria:
                T.nilable(
                  Trycourier::SendMessageParams::Message::Timeout::Criteria::OrSymbol
                ),
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
                  T.nilable(
                    Trycourier::SendMessageParams::Message::Timeout::Criteria::OrSymbol
                  ),
                escalation: T.nilable(Integer),
                message: T.nilable(Integer),
                provider: T.nilable(T::Hash[Symbol, Integer])
              }
            )
          end
          def to_hash
          end

          module Criteria
            extend Trycourier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Trycourier::SendMessageParams::Message::Timeout::Criteria
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NO_ESCALATION =
              T.let(
                :"no-escalation",
                Trycourier::SendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            DELIVERED =
              T.let(
                :delivered,
                Trycourier::SendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            VIEWED =
              T.let(
                :viewed,
                Trycourier::SendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            ENGAGED =
              T.let(
                :engaged,
                Trycourier::SendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Trycourier::SendMessageParams::Message::Timeout::Criteria::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The recipient or a list of recipients of the message
        module To
          extend Trycourier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(Trycourier::UserRecipient, T::Array[Trycourier::Recipient])
            end

          sig do
            override.returns(
              T::Array[Trycourier::SendMessageParams::Message::To::Variants]
            )
          end
          def self.variants
          end

          RecipientArray =
            T.let(
              Trycourier::Internal::Type::ArrayOf[Trycourier::Recipient],
              Trycourier::Internal::Type::Converter
            )
        end
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class SendSendMessageParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::SendSendMessageParams, Courier::Internal::AnyHash)
        end

      # The message property has the following primary top-level properties. They define
      # the destination and content of the message.
      sig { returns(Courier::SendSendMessageParams::Message) }
      attr_reader :message

      sig do
        params(message: Courier::SendSendMessageParams::Message::OrHash).void
      end
      attr_writer :message

      sig do
        params(
          message: Courier::SendSendMessageParams::Message::OrHash,
          request_options: Courier::RequestOptions::OrHash
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
            message: Courier::SendSendMessageParams::Message,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Message < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::SendSendMessageParams::Message,
              Courier::Internal::AnyHash
            )
          end

        # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
        sig { returns(Courier::SendSendMessageParams::Message::Content) }
        attr_reader :content

        sig do
          params(
            content: Courier::SendSendMessageParams::Message::Content::OrHash
          ).void
        end
        attr_writer :content

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_id

        # Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
        # inbox, direct_message, banner, webhook.
        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::SendSendMessageParams::Message::Channel]
            )
          )
        end
        attr_accessor :channels

        sig { returns(T.nilable(Courier::MessageContext)) }
        attr_reader :context

        sig { params(context: T.nilable(Courier::MessageContext::OrHash)).void }
        attr_writer :context

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :data

        sig do
          returns(T.nilable(Courier::SendSendMessageParams::Message::Delay))
        end
        attr_reader :delay

        sig do
          params(
            delay:
              T.nilable(Courier::SendSendMessageParams::Message::Delay::OrHash)
          ).void
        end
        attr_writer :delay

        sig do
          returns(T.nilable(Courier::SendSendMessageParams::Message::Expiry))
        end
        attr_reader :expiry

        sig do
          params(
            expiry:
              T.nilable(Courier::SendSendMessageParams::Message::Expiry::OrHash)
          ).void
        end
        attr_writer :expiry

        sig do
          returns(T.nilable(Courier::SendSendMessageParams::Message::Metadata))
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              T.nilable(
                Courier::SendSendMessageParams::Message::Metadata::OrHash
              )
          ).void
        end
        attr_writer :metadata

        sig do
          returns(
            T.nilable(Courier::SendSendMessageParams::Message::Preferences)
          )
        end
        attr_reader :preferences

        sig do
          params(
            preferences:
              T.nilable(
                Courier::SendSendMessageParams::Message::Preferences::OrHash
              )
          ).void
        end
        attr_writer :preferences

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::SendSendMessageParams::Message::Provider]
            )
          )
        end
        attr_accessor :providers

        # Customize which channels/providers Courier may deliver the message through.
        sig do
          returns(T.nilable(Courier::SendSendMessageParams::Message::Routing))
        end
        attr_reader :routing

        sig do
          params(
            routing:
              T.nilable(
                Courier::SendSendMessageParams::Message::Routing::OrHash
              )
          ).void
        end
        attr_writer :routing

        sig do
          returns(T.nilable(Courier::SendSendMessageParams::Message::Timeout))
        end
        attr_reader :timeout

        sig do
          params(
            timeout:
              T.nilable(
                Courier::SendSendMessageParams::Message::Timeout::OrHash
              )
          ).void
        end
        attr_writer :timeout

        # The recipient or a list of recipients of the message
        sig do
          returns(
            T.nilable(
              T.any(
                Courier::SendSendMessageParams::Message::To::UnionMember0,
                T::Array[Courier::Recipient]
              )
            )
          )
        end
        attr_accessor :to

        # The message property has the following primary top-level properties. They define
        # the destination and content of the message.
        sig do
          params(
            content: Courier::SendSendMessageParams::Message::Content::OrHash,
            brand_id: T.nilable(String),
            channels:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::SendSendMessageParams::Message::Channel::OrHash
                ]
              ),
            context: T.nilable(Courier::MessageContext::OrHash),
            data: T.nilable(T::Hash[Symbol, T.anything]),
            delay:
              T.nilable(Courier::SendSendMessageParams::Message::Delay::OrHash),
            expiry:
              T.nilable(
                Courier::SendSendMessageParams::Message::Expiry::OrHash
              ),
            metadata:
              T.nilable(
                Courier::SendSendMessageParams::Message::Metadata::OrHash
              ),
            preferences:
              T.nilable(
                Courier::SendSendMessageParams::Message::Preferences::OrHash
              ),
            providers:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::SendSendMessageParams::Message::Provider::OrHash
                ]
              ),
            routing:
              T.nilable(
                Courier::SendSendMessageParams::Message::Routing::OrHash
              ),
            timeout:
              T.nilable(
                Courier::SendSendMessageParams::Message::Timeout::OrHash
              ),
            to:
              T.nilable(
                T.any(
                  Courier::SendSendMessageParams::Message::To::UnionMember0::OrHash,
                  T::Array[Courier::Recipient::OrHash]
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          content:,
          brand_id: nil,
          # Define run-time configuration for channels. Valid ChannelId's: email, sms, push,
          # inbox, direct_message, banner, webhook.
          channels: nil,
          context: nil,
          data: nil,
          delay: nil,
          expiry: nil,
          metadata: nil,
          preferences: nil,
          providers: nil,
          # Customize which channels/providers Courier may deliver the message through.
          routing: nil,
          timeout: nil,
          # The recipient or a list of recipients of the message
          to: nil
        )
        end

        sig do
          override.returns(
            {
              content: Courier::SendSendMessageParams::Message::Content,
              brand_id: T.nilable(String),
              channels:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::SendSendMessageParams::Message::Channel
                  ]
                ),
              context: T.nilable(Courier::MessageContext),
              data: T.nilable(T::Hash[Symbol, T.anything]),
              delay: T.nilable(Courier::SendSendMessageParams::Message::Delay),
              expiry:
                T.nilable(Courier::SendSendMessageParams::Message::Expiry),
              metadata:
                T.nilable(Courier::SendSendMessageParams::Message::Metadata),
              preferences:
                T.nilable(Courier::SendSendMessageParams::Message::Preferences),
              providers:
                T.nilable(
                  T::Hash[
                    Symbol,
                    Courier::SendSendMessageParams::Message::Provider
                  ]
                ),
              routing:
                T.nilable(Courier::SendSendMessageParams::Message::Routing),
              timeout:
                T.nilable(Courier::SendSendMessageParams::Message::Timeout),
              to:
                T.nilable(
                  T.any(
                    Courier::SendSendMessageParams::Message::To::UnionMember0,
                    T::Array[Courier::Recipient]
                  )
                )
            }
          )
        end
        def to_hash
        end

        class Content < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Content,
                Courier::Internal::AnyHash
              )
            end

          # The text content displayed in the notification.
          sig { returns(String) }
          attr_accessor :body

          # Title/subject displayed by supported channels.
          sig { returns(String) }
          attr_accessor :title

          # Syntactic sugar to provide a fast shorthand for Courier Elemental Blocks.
          sig { params(body: String, title: String).returns(T.attached_class) }
          def self.new(
            # The text content displayed in the notification.
            body:,
            # Title/subject displayed by supported channels.
            title:
          )
          end

          sig { override.returns({ body: String, title: String }) }
          def to_hash
          end
        end

        class Channel < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Channel,
                Courier::Internal::AnyHash
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
                Courier::SendSendMessageParams::Message::Channel::Metadata
              )
            )
          end
          attr_reader :metadata

          sig do
            params(
              metadata:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Channel::Metadata::OrHash
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
                Courier::SendSendMessageParams::Message::Channel::RoutingMethod::OrSymbol
              )
            )
          end
          attr_accessor :routing_method

          sig do
            returns(
              T.nilable(
                Courier::SendSendMessageParams::Message::Channel::Timeouts
              )
            )
          end
          attr_reader :timeouts

          sig do
            params(
              timeouts:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Channel::Timeouts::OrHash
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
                  Courier::SendSendMessageParams::Message::Channel::Metadata::OrHash
                ),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              providers: T.nilable(T::Array[String]),
              routing_method:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Channel::RoutingMethod::OrSymbol
                ),
              timeouts:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Channel::Timeouts::OrHash
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
                    Courier::SendSendMessageParams::Message::Channel::Metadata
                  ),
                override: T.nilable(T::Hash[Symbol, T.anything]),
                providers: T.nilable(T::Array[String]),
                routing_method:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Channel::RoutingMethod::OrSymbol
                  ),
                timeouts:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Channel::Timeouts
                  )
              }
            )
          end
          def to_hash
          end

          class Metadata < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::SendSendMessageParams::Message::Channel::Metadata,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::SendSendMessageParams::Message::Channel::Metadata::Utm
                )
              )
            end
            attr_reader :utm

            sig do
              params(
                utm:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Channel::Metadata::Utm::OrHash
                  )
              ).void
            end
            attr_writer :utm

            sig do
              params(
                utm:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Channel::Metadata::Utm::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(utm: nil)
            end

            sig do
              override.returns(
                {
                  utm:
                    T.nilable(
                      Courier::SendSendMessageParams::Message::Channel::Metadata::Utm
                    )
                }
              )
            end
            def to_hash
            end

            class Utm < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::SendSendMessageParams::Message::Channel::Metadata::Utm,
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

          # Defaults to `single`.
          module RoutingMethod
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::SendSendMessageParams::Message::Channel::RoutingMethod
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Courier::SendSendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
              )
            SINGLE =
              T.let(
                :single,
                Courier::SendSendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::SendSendMessageParams::Message::Channel::RoutingMethod::TaggedSymbol
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
                  Courier::SendSendMessageParams::Message::Channel::Timeouts,
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
              T.any(
                Courier::SendSendMessageParams::Message::Delay,
                Courier::Internal::AnyHash
              )
            end

          # The duration of the delay in milliseconds.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :duration

          # ISO 8601 timestamp or opening_hours-like format.
          sig { returns(T.nilable(String)) }
          attr_accessor :until_

          sig do
            params(
              duration: T.nilable(Integer),
              until_: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The duration of the delay in milliseconds.
            duration: nil,
            # ISO 8601 timestamp or opening_hours-like format.
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
              T.any(
                Courier::SendSendMessageParams::Message::Expiry,
                Courier::Internal::AnyHash
              )
            end

          # Duration in ms or ISO8601 duration (e.g. P1DT4H).
          sig do
            returns(
              Courier::SendSendMessageParams::Message::Expiry::ExpiresIn::Variants
            )
          end
          attr_accessor :expires_in

          # Epoch or ISO8601 timestamp with timezone.
          sig { returns(T.nilable(String)) }
          attr_accessor :expires_at

          sig do
            params(
              expires_in:
                Courier::SendSendMessageParams::Message::Expiry::ExpiresIn::Variants,
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
                  Courier::SendSendMessageParams::Message::Expiry::ExpiresIn::Variants,
                expires_at: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Duration in ms or ISO8601 duration (e.g. P1DT4H).
          module ExpiresIn
            extend Courier::Internal::Type::Union

            Variants = T.type_alias { T.any(String, Integer) }

            sig do
              override.returns(
                T::Array[
                  Courier::SendSendMessageParams::Message::Expiry::ExpiresIn::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class Metadata < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Metadata,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :event

          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :tags

          sig { returns(T.nilable(String)) }
          attr_accessor :trace_id

          sig do
            returns(
              T.nilable(Courier::SendSendMessageParams::Message::Metadata::Utm)
            )
          end
          attr_reader :utm

          sig do
            params(
              utm:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Metadata::Utm::OrHash
                )
            ).void
          end
          attr_writer :utm

          sig do
            params(
              event: T.nilable(String),
              tags: T.nilable(T::Array[String]),
              trace_id: T.nilable(String),
              utm:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Metadata::Utm::OrHash
                )
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
                utm:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Metadata::Utm
                  )
              }
            )
          end
          def to_hash
          end

          class Utm < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::SendSendMessageParams::Message::Metadata::Utm,
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

        class Preferences < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Preferences,
                Courier::Internal::AnyHash
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

        class Provider < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Provider,
                Courier::Internal::AnyHash
              )
            end

          # JS conditional with access to data/profile.
          sig { returns(T.nilable(String)) }
          attr_accessor :if_

          sig do
            returns(
              T.nilable(
                Courier::SendSendMessageParams::Message::Provider::Metadata
              )
            )
          end
          attr_reader :metadata

          sig do
            params(
              metadata:
                T.nilable(
                  Courier::SendSendMessageParams::Message::Provider::Metadata::OrHash
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
                  Courier::SendSendMessageParams::Message::Provider::Metadata::OrHash
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
                    Courier::SendSendMessageParams::Message::Provider::Metadata
                  ),
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
                  Courier::SendSendMessageParams::Message::Provider::Metadata,
                  Courier::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  Courier::SendSendMessageParams::Message::Provider::Metadata::Utm
                )
              )
            end
            attr_reader :utm

            sig do
              params(
                utm:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Provider::Metadata::Utm::OrHash
                  )
              ).void
            end
            attr_writer :utm

            sig do
              params(
                utm:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::Provider::Metadata::Utm::OrHash
                  )
              ).returns(T.attached_class)
            end
            def self.new(utm: nil)
            end

            sig do
              override.returns(
                {
                  utm:
                    T.nilable(
                      Courier::SendSendMessageParams::Message::Provider::Metadata::Utm
                    )
                }
              )
            end
            def to_hash
            end

            class Utm < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::SendSendMessageParams::Message::Provider::Metadata::Utm,
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
              T.any(
                Courier::SendSendMessageParams::Message::Routing,
                Courier::Internal::AnyHash
              )
            end

          # A list of channels or providers (or nested routing rules).
          sig { returns(T::Array[T.any(String, Courier::MessageRouting)]) }
          attr_accessor :channels

          sig do
            returns(
              Courier::SendSendMessageParams::Message::Routing::Method::OrSymbol
            )
          end
          attr_accessor :method_

          # Customize which channels/providers Courier may deliver the message through.
          sig do
            params(
              channels: T::Array[T.any(String, Courier::MessageRouting)],
              method_:
                Courier::SendSendMessageParams::Message::Routing::Method::OrSymbol
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
                channels: T::Array[T.any(String, Courier::MessageRouting)],
                method_:
                  Courier::SendSendMessageParams::Message::Routing::Method::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Method
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::SendSendMessageParams::Message::Routing::Method
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Courier::SendSendMessageParams::Message::Routing::Method::TaggedSymbol
              )
            SINGLE =
              T.let(
                :single,
                Courier::SendSendMessageParams::Message::Routing::Method::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::SendSendMessageParams::Message::Routing::Method::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Timeout < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::Timeout,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Hash[Symbol, Integer])) }
          attr_accessor :channel

          sig do
            returns(
              T.nilable(
                Courier::SendSendMessageParams::Message::Timeout::Criteria::OrSymbol
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
                  Courier::SendSendMessageParams::Message::Timeout::Criteria::OrSymbol
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
                    Courier::SendSendMessageParams::Message::Timeout::Criteria::OrSymbol
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
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::SendSendMessageParams::Message::Timeout::Criteria
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            NO_ESCALATION =
              T.let(
                :"no-escalation",
                Courier::SendSendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            DELIVERED =
              T.let(
                :delivered,
                Courier::SendSendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            VIEWED =
              T.let(
                :viewed,
                Courier::SendSendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )
            ENGAGED =
              T.let(
                :engaged,
                Courier::SendSendMessageParams::Message::Timeout::Criteria::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::SendSendMessageParams::Message::Timeout::Criteria::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The recipient or a list of recipients of the message
        module To
          extend Courier::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Courier::SendSendMessageParams::Message::To::UnionMember0,
                T::Array[Courier::Recipient]
              )
            end

          class UnionMember0 < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::SendSendMessageParams::Message::To::UnionMember0,
                  Courier::Internal::AnyHash
                )
              end

            # Use `tenant_id` instead.
            sig { returns(T.nilable(String)) }
            attr_accessor :account_id

            # Context such as tenant_id to send the notification with.
            sig { returns(T.nilable(Courier::MessageContext)) }
            attr_reader :context

            sig do
              params(context: T.nilable(Courier::MessageContext::OrHash)).void
            end
            attr_writer :context

            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_accessor :data

            sig { returns(T.nilable(String)) }
            attr_accessor :email

            # The user's preferred ISO 639-1 language code.
            sig { returns(T.nilable(String)) }
            attr_accessor :locale

            sig { returns(T.nilable(String)) }
            attr_accessor :phone_number

            sig do
              returns(
                T.nilable(
                  Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences
                )
              )
            end
            attr_reader :preferences

            sig do
              params(
                preferences:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::OrHash
                  )
              ).void
            end
            attr_writer :preferences

            # Tenant id. Will load brand, default preferences and base context data.
            sig { returns(T.nilable(String)) }
            attr_accessor :tenant_id

            sig { returns(T.nilable(String)) }
            attr_accessor :user_id

            sig do
              params(
                account_id: T.nilable(String),
                context: T.nilable(Courier::MessageContext::OrHash),
                data: T.nilable(T::Hash[Symbol, T.anything]),
                email: T.nilable(String),
                locale: T.nilable(String),
                phone_number: T.nilable(String),
                preferences:
                  T.nilable(
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::OrHash
                  ),
                tenant_id: T.nilable(String),
                user_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Use `tenant_id` instead.
              account_id: nil,
              # Context such as tenant_id to send the notification with.
              context: nil,
              data: nil,
              email: nil,
              # The user's preferred ISO 639-1 language code.
              locale: nil,
              phone_number: nil,
              preferences: nil,
              # Tenant id. Will load brand, default preferences and base context data.
              tenant_id: nil,
              user_id: nil
            )
            end

            sig do
              override.returns(
                {
                  account_id: T.nilable(String),
                  context: T.nilable(Courier::MessageContext),
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  email: T.nilable(String),
                  locale: T.nilable(String),
                  phone_number: T.nilable(String),
                  preferences:
                    T.nilable(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences
                    ),
                  tenant_id: T.nilable(String),
                  user_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            class Preferences < Courier::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences,
                    Courier::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T::Hash[
                    Symbol,
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification
                  ]
                )
              end
              attr_accessor :notifications

              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category
                    ]
                  )
                )
              end
              attr_accessor :categories

              sig { returns(T.nilable(String)) }
              attr_accessor :template_id

              sig do
                params(
                  notifications:
                    T::Hash[
                      Symbol,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::OrHash
                    ],
                  categories:
                    T.nilable(
                      T::Hash[
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::OrHash
                      ]
                    ),
                  template_id: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(notifications:, categories: nil, template_id: nil)
              end

              sig do
                override.returns(
                  {
                    notifications:
                      T::Hash[
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification
                      ],
                    categories:
                      T.nilable(
                        T::Hash[
                          Symbol,
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category
                        ]
                      ),
                    template_id: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              class Notification < Courier::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification,
                      Courier::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::OrSymbol
                  )
                end
                attr_accessor :status

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference
                      ]
                    )
                  )
                end
                attr_accessor :channel_preferences

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule
                      ]
                    )
                  )
                end
                attr_accessor :rules

                sig do
                  returns(
                    T.nilable(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::OrSymbol
                    )
                  )
                end
                attr_accessor :source

                sig do
                  params(
                    status:
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::OrSymbol,
                    channel_preferences:
                      T.nilable(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::OrHash
                        ]
                      ),
                    rules:
                      T.nilable(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule::OrHash
                        ]
                      ),
                    source:
                      T.nilable(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  status:,
                  channel_preferences: nil,
                  rules: nil,
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      status:
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::OrSymbol,
                      channel_preferences:
                        T.nilable(
                          T::Array[
                            Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference
                          ]
                        ),
                      rules:
                        T.nilable(
                          T::Array[
                            Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule
                          ]
                        ),
                      source:
                        T.nilable(
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::OrSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                module Status
                  extend Courier::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OPTED_IN =
                    T.let(
                      :OPTED_IN,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::TaggedSymbol
                    )
                  OPTED_OUT =
                    T.let(
                      :OPTED_OUT,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::TaggedSymbol
                    )
                  REQUIRED =
                    T.let(
                      :REQUIRED,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Status::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class ChannelPreference < Courier::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference,
                        Courier::Internal::AnyHash
                      )
                    end

                  sig do
                    returns(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::OrSymbol
                    )
                  end
                  attr_accessor :channel

                  sig do
                    params(
                      channel:
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::OrSymbol
                    ).returns(T.attached_class)
                  end
                  def self.new(channel:)
                  end

                  sig do
                    override.returns(
                      {
                        channel:
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module Channel
                    extend Courier::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    DIRECT_MESSAGE =
                      T.let(
                        :direct_message,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )
                    EMAIL =
                      T.let(
                        :email,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )
                    PUSH =
                      T.let(
                        :push,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )
                    SMS =
                      T.let(
                        :sms,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )
                    WEBHOOK =
                      T.let(
                        :webhook,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )
                    INBOX =
                      T.let(
                        :inbox,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::ChannelPreference::Channel::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                class Rule < Courier::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Rule,
                        Courier::Internal::AnyHash
                      )
                    end

                  sig { returns(String) }
                  attr_accessor :until_

                  sig { returns(T.nilable(String)) }
                  attr_accessor :start

                  sig do
                    params(until_: String, start: T.nilable(String)).returns(
                      T.attached_class
                    )
                  end
                  def self.new(until_:, start: nil)
                  end

                  sig do
                    override.returns(
                      { until_: String, start: T.nilable(String) }
                    )
                  end
                  def to_hash
                  end
                end

                module Source
                  extend Courier::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  SUBSCRIPTION =
                    T.let(
                      :subscription,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::TaggedSymbol
                    )
                  LIST =
                    T.let(
                      :list,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::TaggedSymbol
                    )
                  RECIPIENT =
                    T.let(
                      :recipient,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Notification::Source::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class Category < Courier::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category,
                      Courier::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::OrSymbol
                  )
                end
                attr_accessor :status

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference
                      ]
                    )
                  )
                end
                attr_accessor :channel_preferences

                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule
                      ]
                    )
                  )
                end
                attr_accessor :rules

                sig do
                  returns(
                    T.nilable(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::OrSymbol
                    )
                  )
                end
                attr_accessor :source

                sig do
                  params(
                    status:
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::OrSymbol,
                    channel_preferences:
                      T.nilable(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::OrHash
                        ]
                      ),
                    rules:
                      T.nilable(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule::OrHash
                        ]
                      ),
                    source:
                      T.nilable(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::OrSymbol
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  status:,
                  channel_preferences: nil,
                  rules: nil,
                  source: nil
                )
                end

                sig do
                  override.returns(
                    {
                      status:
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::OrSymbol,
                      channel_preferences:
                        T.nilable(
                          T::Array[
                            Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference
                          ]
                        ),
                      rules:
                        T.nilable(
                          T::Array[
                            Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule
                          ]
                        ),
                      source:
                        T.nilable(
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::OrSymbol
                        )
                    }
                  )
                end
                def to_hash
                end

                module Status
                  extend Courier::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  OPTED_IN =
                    T.let(
                      :OPTED_IN,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::TaggedSymbol
                    )
                  OPTED_OUT =
                    T.let(
                      :OPTED_OUT,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::TaggedSymbol
                    )
                  REQUIRED =
                    T.let(
                      :REQUIRED,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Status::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class ChannelPreference < Courier::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference,
                        Courier::Internal::AnyHash
                      )
                    end

                  sig do
                    returns(
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::OrSymbol
                    )
                  end
                  attr_accessor :channel

                  sig do
                    params(
                      channel:
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::OrSymbol
                    ).returns(T.attached_class)
                  end
                  def self.new(channel:)
                  end

                  sig do
                    override.returns(
                      {
                        channel:
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module Channel
                    extend Courier::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    DIRECT_MESSAGE =
                      T.let(
                        :direct_message,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )
                    EMAIL =
                      T.let(
                        :email,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )
                    PUSH =
                      T.let(
                        :push,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )
                    SMS =
                      T.let(
                        :sms,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )
                    WEBHOOK =
                      T.let(
                        :webhook,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )
                    INBOX =
                      T.let(
                        :inbox,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::ChannelPreference::Channel::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                class Rule < Courier::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Rule,
                        Courier::Internal::AnyHash
                      )
                    end

                  sig { returns(String) }
                  attr_accessor :until_

                  sig { returns(T.nilable(String)) }
                  attr_accessor :start

                  sig do
                    params(until_: String, start: T.nilable(String)).returns(
                      T.attached_class
                    )
                  end
                  def self.new(until_:, start: nil)
                  end

                  sig do
                    override.returns(
                      { until_: String, start: T.nilable(String) }
                    )
                  end
                  def to_hash
                  end
                end

                module Source
                  extend Courier::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  SUBSCRIPTION =
                    T.let(
                      :subscription,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::TaggedSymbol
                    )
                  LIST =
                    T.let(
                      :list,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::TaggedSymbol
                    )
                  RECIPIENT =
                    T.let(
                      :recipient,
                      Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Courier::SendSendMessageParams::Message::To::UnionMember0::Preferences::Category::Source::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end
          end

          sig do
            override.returns(
              T::Array[Courier::SendSendMessageParams::Message::To::Variants]
            )
          end
          def self.variants
          end

          RecipientArray =
            T.let(
              Courier::Internal::Type::ArrayOf[Courier::Recipient],
              Courier::Internal::Type::Converter
            )
        end
      end
    end
  end
end

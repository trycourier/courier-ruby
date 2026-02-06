# typed: strong

module Courier
  module Models
    class TenantTemplateInput < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TenantTemplateInput, Courier::Internal::AnyHash)
        end

      # Template content configuration including blocks, elements, and message structure
      sig { returns(Courier::ElementalContent) }
      attr_reader :content

      sig { params(content: Courier::ElementalContent::OrHash).void }
      attr_writer :content

      # Channel-specific delivery configuration (email, SMS, push, etc.)
      sig do
        returns(
          T.nilable(T::Hash[Symbol, Courier::TenantTemplateInput::Channel])
        )
      end
      attr_reader :channels

      sig do
        params(
          channels:
            T::Hash[Symbol, Courier::TenantTemplateInput::Channel::OrHash]
        ).void
      end
      attr_writer :channels

      # Provider-specific delivery configuration for routing to specific email/SMS
      # providers
      sig do
        returns(
          T.nilable(T::Hash[Symbol, Courier::TenantTemplateInput::Provider])
        )
      end
      attr_reader :providers

      sig do
        params(
          providers:
            T::Hash[Symbol, Courier::TenantTemplateInput::Provider::OrHash]
        ).void
      end
      attr_writer :providers

      # Message routing configuration for multi-channel delivery strategies
      sig { returns(T.nilable(Courier::MessageRouting)) }
      attr_reader :routing

      sig { params(routing: Courier::MessageRouting::OrHash).void }
      attr_writer :routing

      # Template configuration for creating or updating a tenant notification template
      sig do
        params(
          content: Courier::ElementalContent::OrHash,
          channels:
            T::Hash[Symbol, Courier::TenantTemplateInput::Channel::OrHash],
          providers:
            T::Hash[Symbol, Courier::TenantTemplateInput::Provider::OrHash],
          routing: Courier::MessageRouting::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Template content configuration including blocks, elements, and message structure
        content:,
        # Channel-specific delivery configuration (email, SMS, push, etc.)
        channels: nil,
        # Provider-specific delivery configuration for routing to specific email/SMS
        # providers
        providers: nil,
        # Message routing configuration for multi-channel delivery strategies
        routing: nil
      )
      end

      sig do
        override.returns(
          {
            content: Courier::ElementalContent,
            channels: T::Hash[Symbol, Courier::TenantTemplateInput::Channel],
            providers: T::Hash[Symbol, Courier::TenantTemplateInput::Provider],
            routing: Courier::MessageRouting
          }
        )
      end
      def to_hash
      end

      class Channel < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::TenantTemplateInput::Channel,
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
          returns(T.nilable(Courier::TenantTemplateInput::Channel::Metadata))
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              T.nilable(Courier::TenantTemplateInput::Channel::Metadata::OrHash)
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
              Courier::TenantTemplateInput::Channel::RoutingMethod::OrSymbol
            )
          )
        end
        attr_accessor :routing_method

        sig do
          returns(T.nilable(Courier::TenantTemplateInput::Channel::Timeouts))
        end
        attr_reader :timeouts

        sig do
          params(
            timeouts:
              T.nilable(Courier::TenantTemplateInput::Channel::Timeouts::OrHash)
          ).void
        end
        attr_writer :timeouts

        sig do
          params(
            brand_id: T.nilable(String),
            if_: T.nilable(String),
            metadata:
              T.nilable(
                Courier::TenantTemplateInput::Channel::Metadata::OrHash
              ),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            providers: T.nilable(T::Array[String]),
            routing_method:
              T.nilable(
                Courier::TenantTemplateInput::Channel::RoutingMethod::OrSymbol
              ),
            timeouts:
              T.nilable(Courier::TenantTemplateInput::Channel::Timeouts::OrHash)
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
                T.nilable(Courier::TenantTemplateInput::Channel::Metadata),
              override: T.nilable(T::Hash[Symbol, T.anything]),
              providers: T.nilable(T::Array[String]),
              routing_method:
                T.nilable(
                  Courier::TenantTemplateInput::Channel::RoutingMethod::OrSymbol
                ),
              timeouts:
                T.nilable(Courier::TenantTemplateInput::Channel::Timeouts)
            }
          )
        end
        def to_hash
        end

        class Metadata < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::TenantTemplateInput::Channel::Metadata,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Courier::Utm)) }
          attr_reader :utm

          sig { params(utm: T.nilable(Courier::Utm::OrHash)).void }
          attr_writer :utm

          sig do
            params(utm: T.nilable(Courier::Utm::OrHash)).returns(
              T.attached_class
            )
          end
          def self.new(utm: nil)
          end

          sig { override.returns({ utm: T.nilable(Courier::Utm) }) }
          def to_hash
          end
        end

        # Defaults to `single`.
        module RoutingMethod
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::TenantTemplateInput::Channel::RoutingMethod
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Courier::TenantTemplateInput::Channel::RoutingMethod::TaggedSymbol
            )
          SINGLE =
            T.let(
              :single,
              Courier::TenantTemplateInput::Channel::RoutingMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::TenantTemplateInput::Channel::RoutingMethod::TaggedSymbol
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
                Courier::TenantTemplateInput::Channel::Timeouts,
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

      class Provider < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::TenantTemplateInput::Provider,
              Courier::Internal::AnyHash
            )
          end

        # JS conditional with access to data/profile.
        sig { returns(T.nilable(String)) }
        attr_accessor :if_

        sig do
          returns(T.nilable(Courier::TenantTemplateInput::Provider::Metadata))
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              T.nilable(
                Courier::TenantTemplateInput::Provider::Metadata::OrHash
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
                Courier::TenantTemplateInput::Provider::Metadata::OrHash
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
                T.nilable(Courier::TenantTemplateInput::Provider::Metadata),
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
                Courier::TenantTemplateInput::Provider::Metadata,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Courier::Utm)) }
          attr_reader :utm

          sig { params(utm: T.nilable(Courier::Utm::OrHash)).void }
          attr_writer :utm

          sig do
            params(utm: T.nilable(Courier::Utm::OrHash)).returns(
              T.attached_class
            )
          end
          def self.new(utm: nil)
          end

          sig { override.returns({ utm: T.nilable(Courier::Utm) }) }
          def to_hash
          end
        end
      end
    end
  end
end

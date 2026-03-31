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
      sig { returns(T.nilable(T::Hash[Symbol, Courier::Channel])) }
      attr_reader :channels

      sig { params(channels: T::Hash[Symbol, Courier::Channel::OrHash]).void }
      attr_writer :channels

      # Provider-specific delivery configuration for routing to specific email/SMS
      # providers
      sig { returns(T.nilable(T::Hash[Symbol, Courier::MessageProvidersType])) }
      attr_reader :providers

      sig do
        params(
          providers: T::Hash[Symbol, Courier::MessageProvidersType::OrHash]
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
          channels: T::Hash[Symbol, Courier::Channel::OrHash],
          providers: T::Hash[Symbol, Courier::MessageProvidersType::OrHash],
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
            channels: T::Hash[Symbol, Courier::Channel],
            providers: T::Hash[Symbol, Courier::MessageProvidersType],
            routing: Courier::MessageRouting
          }
        )
      end
      def to_hash
      end
    end
  end
end

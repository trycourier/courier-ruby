# typed: strong

module Courier
  module Models
    class Channel < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Channel, Courier::Internal::AnyHash) }

      # Brand id used for rendering.
      sig { returns(T.nilable(String)) }
      attr_accessor :brand_id

      # JS conditional with access to data/profile.
      sig { returns(T.nilable(String)) }
      attr_accessor :if_

      sig { returns(T.nilable(Courier::ChannelMetadata)) }
      attr_reader :metadata

      sig { params(metadata: T.nilable(Courier::ChannelMetadata::OrHash)).void }
      attr_writer :metadata

      # Channel specific overrides.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :override

      # Providers enabled for this channel.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :providers

      # Defaults to `single`.
      sig { returns(T.nilable(Courier::Channel::RoutingMethod::OrSymbol)) }
      attr_accessor :routing_method

      sig { returns(T.nilable(Courier::Timeouts)) }
      attr_reader :timeouts

      sig { params(timeouts: T.nilable(Courier::Timeouts::OrHash)).void }
      attr_writer :timeouts

      sig do
        params(
          brand_id: T.nilable(String),
          if_: T.nilable(String),
          metadata: T.nilable(Courier::ChannelMetadata::OrHash),
          override: T.nilable(T::Hash[Symbol, T.anything]),
          providers: T.nilable(T::Array[String]),
          routing_method: T.nilable(Courier::Channel::RoutingMethod::OrSymbol),
          timeouts: T.nilable(Courier::Timeouts::OrHash)
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
            metadata: T.nilable(Courier::ChannelMetadata),
            override: T.nilable(T::Hash[Symbol, T.anything]),
            providers: T.nilable(T::Array[String]),
            routing_method:
              T.nilable(Courier::Channel::RoutingMethod::OrSymbol),
            timeouts: T.nilable(Courier::Timeouts)
          }
        )
      end
      def to_hash
      end

      # Defaults to `single`.
      module RoutingMethod
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Channel::RoutingMethod) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL = T.let(:all, Courier::Channel::RoutingMethod::TaggedSymbol)
        SINGLE = T.let(:single, Courier::Channel::RoutingMethod::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::Channel::RoutingMethod::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

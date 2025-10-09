# typed: strong

module Trycourier
  module Models
    class ChannelPreference < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::ChannelPreference, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::ChannelClassification::OrSymbol) }
      attr_accessor :channel

      sig do
        params(channel: Trycourier::ChannelClassification::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(channel:)
      end

      sig do
        override.returns(
          { channel: Trycourier::ChannelClassification::OrSymbol }
        )
      end
      def to_hash
      end
    end
  end
end

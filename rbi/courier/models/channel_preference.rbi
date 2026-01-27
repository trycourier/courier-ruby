# typed: strong

module Courier
  module Models
    class ChannelPreference < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ChannelPreference, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::ChannelClassification::OrSymbol) }
      attr_accessor :channel

      sig do
        params(channel: Courier::ChannelClassification::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(channel:)
      end

      sig do
        override.returns({ channel: Courier::ChannelClassification::OrSymbol })
      end
      def to_hash
      end
    end
  end
end

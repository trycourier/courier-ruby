# typed: strong

module Trycourier
  module Models
    module ChannelClassification
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Trycourier::ChannelClassification) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DIRECT_MESSAGE =
        T.let(:direct_message, Trycourier::ChannelClassification::TaggedSymbol)
      EMAIL = T.let(:email, Trycourier::ChannelClassification::TaggedSymbol)
      PUSH = T.let(:push, Trycourier::ChannelClassification::TaggedSymbol)
      SMS = T.let(:sms, Trycourier::ChannelClassification::TaggedSymbol)
      WEBHOOK = T.let(:webhook, Trycourier::ChannelClassification::TaggedSymbol)
      INBOX = T.let(:inbox, Trycourier::ChannelClassification::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Trycourier::ChannelClassification::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end

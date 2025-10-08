# typed: strong

module Courier
  module Models
    module ChannelClassification
      extend Courier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Courier::ChannelClassification) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DIRECT_MESSAGE =
        T.let(:direct_message, Courier::ChannelClassification::TaggedSymbol)
      EMAIL = T.let(:email, Courier::ChannelClassification::TaggedSymbol)
      PUSH = T.let(:push, Courier::ChannelClassification::TaggedSymbol)
      SMS = T.let(:sms, Courier::ChannelClassification::TaggedSymbol)
      WEBHOOK = T.let(:webhook, Courier::ChannelClassification::TaggedSymbol)
      INBOX = T.let(:inbox, Courier::ChannelClassification::TaggedSymbol)

      sig do
        override.returns(T::Array[Courier::ChannelClassification::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end

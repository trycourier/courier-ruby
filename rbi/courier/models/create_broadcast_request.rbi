# typed: strong

module Courier
  module Models
    class CreateBroadcastRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::CreateBroadcastRequest, Courier::Internal::AnyHash)
        end

      # The single delivery channel for this broadcast.
      sig { returns(Courier::CreateBroadcastRequest::Channel::OrSymbol) }
      attr_accessor :channel

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Request body for creating a broadcast.
      sig do
        params(
          channel: Courier::CreateBroadcastRequest::Channel::OrSymbol,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The single delivery channel for this broadcast.
        channel:,
        # Human-readable name.
        name:
      )
      end

      sig do
        override.returns(
          {
            channel: Courier::CreateBroadcastRequest::Channel::OrSymbol,
            name: String
          }
        )
      end
      def to_hash
      end

      # The single delivery channel for this broadcast.
      module Channel
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::CreateBroadcastRequest::Channel)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EMAIL =
          T.let(:email, Courier::CreateBroadcastRequest::Channel::TaggedSymbol)
        SMS =
          T.let(:sms, Courier::CreateBroadcastRequest::Channel::TaggedSymbol)
        PUSH =
          T.let(:push, Courier::CreateBroadcastRequest::Channel::TaggedSymbol)
        INBOX =
          T.let(:inbox, Courier::CreateBroadcastRequest::Channel::TaggedSymbol)
        SLACK =
          T.let(:slack, Courier::CreateBroadcastRequest::Channel::TaggedSymbol)
        MSTEAMS =
          T.let(
            :msteams,
            Courier::CreateBroadcastRequest::Channel::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::CreateBroadcastRequest::Channel::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

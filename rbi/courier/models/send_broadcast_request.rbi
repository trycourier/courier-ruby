# typed: strong

module Courier
  module Models
    class SendBroadcastRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendBroadcastRequest, Courier::Internal::AnyHash)
        end

      # ID of the target list or audience.
      sig { returns(String) }
      attr_accessor :recipient_id

      # Whether the broadcast targets a list or an audience.
      sig { returns(Courier::SendBroadcastRequest::RecipientType::OrSymbol) }
      attr_accessor :recipient_type

      # Request body for sending a broadcast immediately.
      sig do
        params(
          recipient_id: String,
          recipient_type: Courier::SendBroadcastRequest::RecipientType::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the target list or audience.
        recipient_id:,
        # Whether the broadcast targets a list or an audience.
        recipient_type:
      )
      end

      sig do
        override.returns(
          {
            recipient_id: String,
            recipient_type:
              Courier::SendBroadcastRequest::RecipientType::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Whether the broadcast targets a list or an audience.
      module RecipientType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::SendBroadcastRequest::RecipientType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Courier::SendBroadcastRequest::RecipientType::TaggedSymbol
          )
        AUDIENCE =
          T.let(
            :audience,
            Courier::SendBroadcastRequest::RecipientType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::SendBroadcastRequest::RecipientType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class InboundTrackEventParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::InboundTrackEventParams, Courier::Internal::AnyHash)
        end

      # A descriptive name of the event. This name will appear as a trigger in the
      # Courier Automation Trigger node.
      sig { returns(String) }
      attr_accessor :event

      # A required unique identifier that will be used to de-duplicate requests. If not
      # unique, will respond with 409 Conflict status
      sig { returns(String) }
      attr_accessor :message_id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :properties

      sig { returns(Courier::InboundTrackEventParams::Type::OrSymbol) }
      attr_accessor :type

      # The user id associated with the track
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          event: String,
          message_id: String,
          properties: T::Hash[Symbol, T.anything],
          type: Courier::InboundTrackEventParams::Type::OrSymbol,
          user_id: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A descriptive name of the event. This name will appear as a trigger in the
        # Courier Automation Trigger node.
        event:,
        # A required unique identifier that will be used to de-duplicate requests. If not
        # unique, will respond with 409 Conflict status
        message_id:,
        properties:,
        type:,
        # The user id associated with the track
        user_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            event: String,
            message_id: String,
            properties: T::Hash[Symbol, T.anything],
            type: Courier::InboundTrackEventParams::Type::OrSymbol,
            user_id: T.nilable(String),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::InboundTrackEventParams::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRACK =
          T.let(:track, Courier::InboundTrackEventParams::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::InboundTrackEventParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

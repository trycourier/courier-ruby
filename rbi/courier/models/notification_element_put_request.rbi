# typed: strong

module Courier
  module Models
    class NotificationElementPutRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationElementPutRequest,
            Courier::Internal::AnyHash
          )
        end

      # Element type (text, meta, action, image, etc.).
      sig { returns(String) }
      attr_accessor :type

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :channels

      sig { params(channels: T::Array[String]).void }
      attr_writer :channels

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :data

      sig { params(data: T::Hash[Symbol, T.anything]).void }
      attr_writer :data

      sig { returns(T.nilable(String)) }
      attr_reader :if_

      sig { params(if_: String).void }
      attr_writer :if_

      sig { returns(T.nilable(String)) }
      attr_reader :loop_

      sig { params(loop_: String).void }
      attr_writer :loop_

      sig { returns(T.nilable(String)) }
      attr_reader :ref

      sig { params(ref: String).void }
      attr_writer :ref

      # Template state. Defaults to `DRAFT`.
      sig { returns(T.nilable(Courier::NotificationTemplateState::OrSymbol)) }
      attr_reader :state

      sig { params(state: Courier::NotificationTemplateState::OrSymbol).void }
      attr_writer :state

      # Request body for updating a single element. Additional type-specific fields are
      # allowed.
      sig do
        params(
          type: String,
          channels: T::Array[String],
          data: T::Hash[Symbol, T.anything],
          if_: String,
          loop_: String,
          ref: String,
          state: Courier::NotificationTemplateState::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Element type (text, meta, action, image, etc.).
        type:,
        channels: nil,
        data: nil,
        if_: nil,
        loop_: nil,
        ref: nil,
        # Template state. Defaults to `DRAFT`.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            type: String,
            channels: T::Array[String],
            data: T::Hash[Symbol, T.anything],
            if_: String,
            loop_: String,
            ref: String,
            state: Courier::NotificationTemplateState::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class NotificationTemplateUpdateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateUpdateRequest,
            Courier::Internal::AnyHash
          )
        end

      # Core template fields used in POST and PUT request bodies (nested under a
      # `notification` key) and returned at the top level in responses.
      sig { returns(Courier::NotificationTemplatePayload) }
      attr_reader :notification

      sig do
        params(notification: Courier::NotificationTemplatePayload::OrHash).void
      end
      attr_writer :notification

      # Template state after update. Case-insensitive input, normalized to uppercase in
      # the response. Defaults to "DRAFT".
      sig do
        returns(
          T.nilable(Courier::NotificationTemplateUpdateRequest::State::OrSymbol)
        )
      end
      attr_reader :state

      sig do
        params(
          state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol
        ).void
      end
      attr_writer :state

      # Request body for replacing a notification template. Same shape as create. All
      # fields required (PUT = full replacement).
      sig do
        params(
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Core template fields used in POST and PUT request bodies (nested under a
        # `notification` key) and returned at the top level in responses.
        notification:,
        # Template state after update. Case-insensitive input, normalized to uppercase in
        # the response. Defaults to "DRAFT".
        state: nil
      )
      end

      sig do
        override.returns(
          {
            notification: Courier::NotificationTemplatePayload,
            state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Template state after update. Case-insensitive input, normalized to uppercase in
      # the response. Defaults to "DRAFT".
      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationTemplateUpdateRequest::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::NotificationTemplateUpdateRequest::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::NotificationTemplateUpdateRequest::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::NotificationTemplateUpdateRequest::State::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class NotificationTemplateCreateRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateCreateRequest,
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

      # Template state after creation. Case-insensitive input, normalized to uppercase
      # in the response. Defaults to "DRAFT".
      sig do
        returns(
          T.nilable(Courier::NotificationTemplateCreateRequest::State::OrSymbol)
        )
      end
      attr_reader :state

      sig do
        params(
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol
        ).void
      end
      attr_writer :state

      # Request body for creating a notification template.
      sig do
        params(
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Core template fields used in POST and PUT request bodies (nested under a
        # `notification` key) and returned at the top level in responses.
        notification:,
        # Template state after creation. Case-insensitive input, normalized to uppercase
        # in the response. Defaults to "DRAFT".
        state: nil
      )
      end

      sig do
        override.returns(
          {
            notification: Courier::NotificationTemplatePayload,
            state: Courier::NotificationTemplateCreateRequest::State::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Template state after creation. Case-insensitive input, normalized to uppercase
      # in the response. Defaults to "DRAFT".
      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationTemplateCreateRequest::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::NotificationTemplateCreateRequest::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::NotificationTemplateCreateRequest::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::NotificationTemplateCreateRequest::State::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end

# typed: strong

module Courier
  module Models
    class NotificationTemplateMutationResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateMutationResponse,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(Courier::NotificationTemplateMutationResponse::Notification)
      end
      attr_reader :notification

      sig do
        params(
          notification:
            Courier::NotificationTemplateMutationResponse::Notification::OrHash
        ).void
      end
      attr_writer :notification

      # The template state after the operation. Always uppercase.
      sig do
        returns(
          Courier::NotificationTemplateMutationResponse::State::TaggedSymbol
        )
      end
      attr_accessor :state

      # Response returned by POST and PUT operations.
      sig do
        params(
          notification:
            Courier::NotificationTemplateMutationResponse::Notification::OrHash,
          state: Courier::NotificationTemplateMutationResponse::State::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        notification:,
        # The template state after the operation. Always uppercase.
        state:
      )
      end

      sig do
        override.returns(
          {
            notification:
              Courier::NotificationTemplateMutationResponse::Notification,
            state:
              Courier::NotificationTemplateMutationResponse::State::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Notification < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationTemplateMutationResponse::Notification,
              Courier::Internal::AnyHash
            )
          end

        # The ID of the created or updated template.
        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # The ID of the created or updated template.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      # The template state after the operation. Always uppercase.
      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationTemplateMutationResponse::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::NotificationTemplateMutationResponse::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::NotificationTemplateMutationResponse::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::NotificationTemplateMutationResponse::State::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end

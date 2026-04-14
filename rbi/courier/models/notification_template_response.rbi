# typed: strong

module Courier
  module Models
    class NotificationTemplateResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateResponse,
            Courier::Internal::AnyHash
          )
        end

      # Epoch milliseconds when the template was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the creator.
      sig { returns(String) }
      attr_accessor :creator

      # Full document shape used in POST and PUT request bodies, and returned inside the
      # GET response envelope.
      sig { returns(Courier::NotificationTemplateResponse::Notification) }
      attr_reader :notification

      sig do
        params(
          notification:
            Courier::NotificationTemplateResponse::Notification::OrHash
        ).void
      end
      attr_writer :notification

      # The template state. Always uppercase.
      sig do
        returns(Courier::NotificationTemplateResponse::State::TaggedSymbol)
      end
      attr_accessor :state

      # Epoch milliseconds of last update.
      sig { returns(T.nilable(Integer)) }
      attr_reader :updated

      sig { params(updated: Integer).void }
      attr_writer :updated

      # User ID of the last updater.
      sig { returns(T.nilable(String)) }
      attr_reader :updater

      sig { params(updater: String).void }
      attr_writer :updater

      # Response for GET /notifications/{id}, POST /notifications, and PUT
      # /notifications/{id}. Wraps the template payload inside a `notification` key
      # alongside metadata.
      sig do
        params(
          created: Integer,
          creator: String,
          notification:
            Courier::NotificationTemplateResponse::Notification::OrHash,
          state: Courier::NotificationTemplateResponse::State::OrSymbol,
          updated: Integer,
          updater: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Epoch milliseconds when the template was created.
        created:,
        # User ID of the creator.
        creator:,
        # Full document shape used in POST and PUT request bodies, and returned inside the
        # GET response envelope.
        notification:,
        # The template state. Always uppercase.
        state:,
        # Epoch milliseconds of last update.
        updated: nil,
        # User ID of the last updater.
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            created: Integer,
            creator: String,
            notification: Courier::NotificationTemplateResponse::Notification,
            state: Courier::NotificationTemplateResponse::State::TaggedSymbol,
            updated: Integer,
            updater: String
          }
        )
      end
      def to_hash
      end

      class Notification < Courier::Models::NotificationTemplatePayload
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationTemplateResponse::Notification,
              Courier::Internal::AnyHash
            )
          end

        # The template ID.
        sig { returns(String) }
        attr_accessor :id

        # Full document shape used in POST and PUT request bodies, and returned inside the
        # GET response envelope.
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # The template ID.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      # The template state. Always uppercase.
      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationTemplateResponse::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::NotificationTemplateResponse::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::NotificationTemplateResponse::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::NotificationTemplateResponse::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

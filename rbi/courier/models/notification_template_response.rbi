# typed: strong

module Courier
  module Models
    class NotificationTemplateResponse < Courier::Models::NotificationTemplatePayload
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateResponse,
            Courier::Internal::AnyHash
          )
        end

      # The template ID.
      sig { returns(String) }
      attr_accessor :id

      # Epoch milliseconds when the template was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the creator.
      sig { returns(String) }
      attr_accessor :creator

      # The template state. Always uppercase.
      sig do
        returns(Courier::NotificationTemplateResponse::State::TaggedSymbol)
      end
      attr_accessor :state

      # A template's send-time alias as returned by a read, omitted entirely when it has
      # none. Usually a single string; an array for a template that resolves from
      # several aliases, which writes through this API can no longer produce — only
      # templates predating that restriction, or aliases attached outside this API, hold
      # more than one.
      sig { returns(T.nilable(Courier::NotificationTemplateAlias::Variants)) }
      attr_reader :alias_

      sig { params(alias_: Courier::NotificationTemplateAlias::Variants).void }
      attr_writer :alias_

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
      # /notifications/{id}. Returns all template fields at the top level.
      sig do
        params(
          id: String,
          created: Integer,
          creator: String,
          state: Courier::NotificationTemplateResponse::State::OrSymbol,
          alias_: Courier::NotificationTemplateAlias::Variants,
          updated: Integer,
          updater: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The template ID.
        id:,
        # Epoch milliseconds when the template was created.
        created:,
        # User ID of the creator.
        creator:,
        # The template state. Always uppercase.
        state:,
        # A template's send-time alias as returned by a read, omitted entirely when it has
        # none. Usually a single string; an array for a template that resolves from
        # several aliases, which writes through this API can no longer produce — only
        # templates predating that restriction, or aliases attached outside this API, hold
        # more than one.
        alias_: nil,
        # Epoch milliseconds of last update.
        updated: nil,
        # User ID of the last updater.
        updater: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created: Integer,
            creator: String,
            state: Courier::NotificationTemplateResponse::State::TaggedSymbol,
            alias_: Courier::NotificationTemplateAlias::Variants,
            updated: Integer,
            updater: String
          }
        )
      end
      def to_hash
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

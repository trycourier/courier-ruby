# typed: strong

module Courier
  module Models
    class NotificationTemplateSummary < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationTemplateSummary,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Epoch milliseconds when the template was created.
      sig { returns(Integer) }
      attr_accessor :created

      # User ID of the creator.
      sig { returns(String) }
      attr_accessor :creator

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Courier::NotificationTemplateSummary::State::TaggedSymbol) }
      attr_accessor :state

      sig { returns(T::Array[String]) }
      attr_accessor :tags

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

      # V2 (CDS) template summary returned in list responses.
      sig do
        params(
          id: String,
          created: Integer,
          creator: String,
          name: String,
          state: Courier::NotificationTemplateSummary::State::OrSymbol,
          tags: T::Array[String],
          updated: Integer,
          updater: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Epoch milliseconds when the template was created.
        created:,
        # User ID of the creator.
        creator:,
        name:,
        state:,
        tags:,
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
            name: String,
            state: Courier::NotificationTemplateSummary::State::TaggedSymbol,
            tags: T::Array[String],
            updated: Integer,
            updater: String
          }
        )
      end
      def to_hash
      end

      module State
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationTemplateSummary::State)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT =
          T.let(
            :DRAFT,
            Courier::NotificationTemplateSummary::State::TaggedSymbol
          )
        PUBLISHED =
          T.let(
            :PUBLISHED,
            Courier::NotificationTemplateSummary::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::NotificationTemplateSummary::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

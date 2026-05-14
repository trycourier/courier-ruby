# typed: strong

module Courier
  module Models
    class JourneyTemplateSummary < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyTemplateSummary, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Integer) }
      attr_accessor :created

      sig { returns(String) }
      attr_accessor :creator

      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :state

      sig { returns(T::Array[String]) }
      attr_accessor :tags

      sig { returns(T.nilable(Integer)) }
      attr_reader :updated

      sig { params(updated: Integer).void }
      attr_writer :updated

      sig { returns(T.nilable(String)) }
      attr_reader :updater

      sig { params(updater: String).void }
      attr_writer :updater

      sig do
        params(
          id: String,
          created: Integer,
          creator: String,
          name: String,
          state: String,
          tags: T::Array[String],
          updated: Integer,
          updater: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created:,
        creator:,
        name:,
        state:,
        tags:,
        updated: nil,
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
            state: String,
            tags: T::Array[String],
            updated: Integer,
            updater: String
          }
        )
      end
      def to_hash
      end
    end
  end
end

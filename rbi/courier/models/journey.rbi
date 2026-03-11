# typed: strong

module Courier
  module Models
    class Journey < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Journey, Courier::Internal::AnyHash) }

      # The unique identifier of the journey.
      sig { returns(String) }
      attr_accessor :id

      # The name of the journey.
      sig { returns(String) }
      attr_accessor :name

      # The version of the journey (published or draft).
      sig { returns(Courier::Journey::Version::TaggedSymbol) }
      attr_accessor :version

      # ISO 8601 timestamp when the journey was created.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # ISO 8601 timestamp when the journey was last updated.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # A journey template representing an automation workflow.
      sig do
        params(
          id: String,
          name: String,
          version: Courier::Journey::Version::OrSymbol,
          created_at: Time,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the journey.
        id:,
        # The name of the journey.
        name:,
        # The version of the journey (published or draft).
        version:,
        # ISO 8601 timestamp when the journey was created.
        created_at: nil,
        # ISO 8601 timestamp when the journey was last updated.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            version: Courier::Journey::Version::TaggedSymbol,
            created_at: Time,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # The version of the journey (published or draft).
      module Version
        extend Courier::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Courier::Journey::Version) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PUBLISHED = T.let(:published, Courier::Journey::Version::TaggedSymbol)
        DRAFT = T.let(:draft, Courier::Journey::Version::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Journey::Version::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end

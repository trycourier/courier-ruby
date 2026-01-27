# typed: strong

module Courier
  module Models
    class AutomationTemplate < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AutomationTemplate, Courier::Internal::AnyHash)
        end

      # The unique identifier of the automation template.
      sig { returns(String) }
      attr_accessor :id

      # The name of the automation template.
      sig { returns(String) }
      attr_accessor :name

      # The version of the template published or drafted.
      sig { returns(Courier::AutomationTemplate::Version::TaggedSymbol) }
      attr_accessor :version

      # ISO 8601 timestamp when the template was created.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # ISO 8601 timestamp when the template was last updated.
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          name: String,
          version: Courier::AutomationTemplate::Version::OrSymbol,
          created_at: Time,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the automation template.
        id:,
        # The name of the automation template.
        name:,
        # The version of the template published or drafted.
        version:,
        # ISO 8601 timestamp when the template was created.
        created_at: nil,
        # ISO 8601 timestamp when the template was last updated.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            version: Courier::AutomationTemplate::Version::TaggedSymbol,
            created_at: Time,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # The version of the template published or drafted.
      module Version
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::AutomationTemplate::Version) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PUBLISHED =
          T.let(:published, Courier::AutomationTemplate::Version::TaggedSymbol)
        DRAFT =
          T.let(:draft, Courier::AutomationTemplate::Version::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AutomationTemplate::Version::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

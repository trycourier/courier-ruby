# typed: strong

module Trycourier
  module Models
    class Audience < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Audience, Trycourier::Internal::AnyHash)
        end

      # A unique identifier representing the audience_id
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :created_at

      # A description of the audience
      sig { returns(String) }
      attr_accessor :description

      # The name of the audience
      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :updated_at

      # Filter that contains an array of FilterConfig items
      sig { returns(T.nilable(Trycourier::Filter)) }
      attr_reader :filter

      sig { params(filter: T.nilable(Trycourier::Filter::OrHash)).void }
      attr_writer :filter

      # The logical operator (AND/OR) for the top-level filter
      sig { returns(T.nilable(Trycourier::Audience::Operator::TaggedSymbol)) }
      attr_reader :operator

      sig { params(operator: Trycourier::Audience::Operator::OrSymbol).void }
      attr_writer :operator

      sig do
        params(
          id: String,
          created_at: String,
          description: String,
          name: String,
          updated_at: String,
          filter: T.nilable(Trycourier::Filter::OrHash),
          operator: Trycourier::Audience::Operator::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier representing the audience_id
        id:,
        created_at:,
        # A description of the audience
        description:,
        # The name of the audience
        name:,
        updated_at:,
        # Filter that contains an array of FilterConfig items
        filter: nil,
        # The logical operator (AND/OR) for the top-level filter
        operator: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: String,
            description: String,
            name: String,
            updated_at: String,
            filter: T.nilable(Trycourier::Filter),
            operator: Trycourier::Audience::Operator::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The logical operator (AND/OR) for the top-level filter
      module Operator
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::Audience::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AND = T.let(:AND, Trycourier::Audience::Operator::TaggedSymbol)
        OR = T.let(:OR, Trycourier::Audience::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::Audience::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

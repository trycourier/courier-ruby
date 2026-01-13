# typed: strong

module Trycourier
  module Models
    class AudienceUpdateParams < Trycourier::Internal::Type::BaseModel
      extend Trycourier::Internal::Type::RequestParameters::Converter
      include Trycourier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Trycourier::AudienceUpdateParams, Trycourier::Internal::AnyHash)
        end

      # A description of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Filter that contains an array of FilterConfig items
      sig { returns(T.nilable(Trycourier::Filter)) }
      attr_reader :filter

      sig { params(filter: T.nilable(Trycourier::Filter::OrHash)).void }
      attr_writer :filter

      # The name of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The logical operator (AND/OR) for the top-level filter
      sig do
        returns(T.nilable(Trycourier::AudienceUpdateParams::Operator::OrSymbol))
      end
      attr_accessor :operator

      sig do
        params(
          description: T.nilable(String),
          filter: T.nilable(Trycourier::Filter::OrHash),
          name: T.nilable(String),
          operator:
            T.nilable(Trycourier::AudienceUpdateParams::Operator::OrSymbol),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A description of the audience
        description: nil,
        # Filter that contains an array of FilterConfig items
        filter: nil,
        # The name of the audience
        name: nil,
        # The logical operator (AND/OR) for the top-level filter
        operator: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: T.nilable(String),
            filter: T.nilable(Trycourier::Filter),
            name: T.nilable(String),
            operator:
              T.nilable(Trycourier::AudienceUpdateParams::Operator::OrSymbol),
            request_options: Trycourier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The logical operator (AND/OR) for the top-level filter
      module Operator
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::AudienceUpdateParams::Operator)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AND =
          T.let(:AND, Trycourier::AudienceUpdateParams::Operator::TaggedSymbol)
        OR =
          T.let(:OR, Trycourier::AudienceUpdateParams::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::AudienceUpdateParams::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

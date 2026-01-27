# typed: strong

module Courier
  module Models
    class AudienceUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::AudienceUpdateParams, Courier::Internal::AnyHash)
        end

      # A description of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Filter configuration for audience membership containing an array of filter rules
      sig { returns(T.nilable(Courier::AudienceFilterConfig)) }
      attr_reader :filter

      sig do
        params(filter: T.nilable(Courier::AudienceFilterConfig::OrHash)).void
      end
      attr_writer :filter

      # The name of the audience
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The logical operator (AND/OR) for the top-level filter
      sig do
        returns(T.nilable(Courier::AudienceUpdateParams::Operator::OrSymbol))
      end
      attr_accessor :operator

      sig do
        params(
          description: T.nilable(String),
          filter: T.nilable(Courier::AudienceFilterConfig::OrHash),
          name: T.nilable(String),
          operator:
            T.nilable(Courier::AudienceUpdateParams::Operator::OrSymbol),
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A description of the audience
        description: nil,
        # Filter configuration for audience membership containing an array of filter rules
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
            filter: T.nilable(Courier::AudienceFilterConfig),
            name: T.nilable(String),
            operator:
              T.nilable(Courier::AudienceUpdateParams::Operator::OrSymbol),
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The logical operator (AND/OR) for the top-level filter
      module Operator
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::AudienceUpdateParams::Operator)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AND = T.let(:AND, Courier::AudienceUpdateParams::Operator::TaggedSymbol)
        OR = T.let(:OR, Courier::AudienceUpdateParams::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AudienceUpdateParams::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

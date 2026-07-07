# typed: strong

module Courier
  module Models
    class AudienceFilterConfig < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AudienceFilterConfig, Courier::Internal::AnyHash)
        end

      # Array of filter rules (single conditions or nested groups)
      sig { returns(T::Array[Courier::FilterConfig]) }
      attr_accessor :filters

      # The logical operator (AND/OR) combining the rules in `filters`. Required when
      # `filters` contains more than one rule. If omitted, the top-level `operator`
      # field on the request is used instead.
      sig do
        returns(T.nilable(Courier::AudienceFilterConfig::Operator::OrSymbol))
      end
      attr_reader :operator

      sig do
        params(operator: Courier::AudienceFilterConfig::Operator::OrSymbol).void
      end
      attr_writer :operator

      # Filter configuration for audience membership containing an array of filter rules
      sig do
        params(
          filters: T::Array[Courier::FilterConfig::OrHash],
          operator: Courier::AudienceFilterConfig::Operator::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of filter rules (single conditions or nested groups)
        filters:,
        # The logical operator (AND/OR) combining the rules in `filters`. Required when
        # `filters` contains more than one rule. If omitted, the top-level `operator`
        # field on the request is used instead.
        operator: nil
      )
      end

      sig do
        override.returns(
          {
            filters: T::Array[Courier::FilterConfig],
            operator: Courier::AudienceFilterConfig::Operator::OrSymbol
          }
        )
      end
      def to_hash
      end

      # The logical operator (AND/OR) combining the rules in `filters`. Required when
      # `filters` contains more than one rule. If omitted, the top-level `operator`
      # field on the request is used instead.
      module Operator
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::AudienceFilterConfig::Operator)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AND = T.let(:AND, Courier::AudienceFilterConfig::Operator::TaggedSymbol)
        OR = T.let(:OR, Courier::AudienceFilterConfig::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::AudienceFilterConfig::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

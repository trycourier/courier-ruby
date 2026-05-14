# typed: strong

module Courier
  module Models
    class JourneyFetchGetDeleteNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyFetchGetDeleteNode, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::JourneyMergeStrategy::OrSymbol) }
      attr_accessor :merge_strategy

      sig { returns(Courier::JourneyFetchGetDeleteNode::Method::OrSymbol) }
      attr_accessor :method_

      sig { returns(Courier::JourneyFetchGetDeleteNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
      # group, or an AND/OR nested group. Omit the `conditions` property entirely to
      # express "no conditions".
      sig do
        returns(
          T.nilable(
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup,
              Courier::JourneyConditionNestedGroup
            )
          )
        )
      end
      attr_reader :conditions

      sig do
        params(
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            )
        ).void
      end
      attr_writer :conditions

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :query_params

      sig { params(query_params: T::Hash[Symbol, String]).void }
      attr_writer :query_params

      # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :response_schema

      sig { params(response_schema: T::Hash[Symbol, T.anything]).void }
      attr_writer :response_schema

      sig do
        params(
          merge_strategy: Courier::JourneyMergeStrategy::OrSymbol,
          method_: Courier::JourneyFetchGetDeleteNode::Method::OrSymbol,
          type: Courier::JourneyFetchGetDeleteNode::Type::OrSymbol,
          url: String,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          headers: T::Hash[Symbol, String],
          query_params: T::Hash[Symbol, String],
          response_schema: T::Hash[Symbol, T.anything]
        ).returns(T.attached_class)
      end
      def self.new(
        merge_strategy:,
        method_:,
        type:,
        url:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        headers: nil,
        query_params: nil,
        # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
        response_schema: nil
      )
      end

      sig do
        override.returns(
          {
            merge_strategy: Courier::JourneyMergeStrategy::OrSymbol,
            method_: Courier::JourneyFetchGetDeleteNode::Method::OrSymbol,
            type: Courier::JourneyFetchGetDeleteNode::Type::OrSymbol,
            url: String,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            headers: T::Hash[Symbol, String],
            query_params: T::Hash[Symbol, String],
            response_schema: T::Hash[Symbol, T.anything]
          }
        )
      end
      def to_hash
      end

      module Method
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyFetchGetDeleteNode::Method)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GET =
          T.let(:get, Courier::JourneyFetchGetDeleteNode::Method::TaggedSymbol)
        DELETE =
          T.let(
            :delete,
            Courier::JourneyFetchGetDeleteNode::Method::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyFetchGetDeleteNode::Method::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyFetchGetDeleteNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FETCH =
          T.let(:fetch, Courier::JourneyFetchGetDeleteNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyFetchGetDeleteNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

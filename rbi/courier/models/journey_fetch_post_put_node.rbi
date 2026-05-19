# typed: strong

module Courier
  module Models
    class JourneyFetchPostPutNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyFetchPostPutNode, Courier::Internal::AnyHash)
        end

      # Strategy for merging a fetch response into the journey run state.
      sig { returns(Courier::JourneyMergeStrategy::OrSymbol) }
      attr_accessor :merge_strategy

      sig { returns(Courier::JourneyFetchPostPutNode::Method::OrSymbol) }
      attr_accessor :method_

      sig { returns(Courier::JourneyFetchPostPutNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig { returns(T.nilable(String)) }
      attr_reader :body

      sig { params(body: String).void }
      attr_writer :body

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

      # Issue an HTTP POST or PUT request with a `body` and merge the response into the
      # journey state per `merge_strategy`.
      sig do
        params(
          merge_strategy: Courier::JourneyMergeStrategy::OrSymbol,
          method_: Courier::JourneyFetchPostPutNode::Method::OrSymbol,
          type: Courier::JourneyFetchPostPutNode::Type::OrSymbol,
          url: String,
          id: String,
          body: String,
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
        # Strategy for merging a fetch response into the journey run state.
        merge_strategy:,
        method_:,
        type:,
        url:,
        id: nil,
        body: nil,
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
            method_: Courier::JourneyFetchPostPutNode::Method::OrSymbol,
            type: Courier::JourneyFetchPostPutNode::Type::OrSymbol,
            url: String,
            id: String,
            body: String,
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
            T.all(Symbol, Courier::JourneyFetchPostPutNode::Method)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POST =
          T.let(:post, Courier::JourneyFetchPostPutNode::Method::TaggedSymbol)
        PUT =
          T.let(:put, Courier::JourneyFetchPostPutNode::Method::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyFetchPostPutNode::Method::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneyFetchPostPutNode::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FETCH =
          T.let(:fetch, Courier::JourneyFetchPostPutNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyFetchPostPutNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

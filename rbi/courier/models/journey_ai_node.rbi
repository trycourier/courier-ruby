# typed: strong

module Courier
  module Models
    class JourneyAINode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyAINode, Courier::Internal::AnyHash)
        end

      # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :output_schema

      sig { returns(Courier::JourneyAINode::Type::OrSymbol) }
      attr_accessor :type

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

      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      sig { returns(T.nilable(String)) }
      attr_reader :user_prompt

      sig { params(user_prompt: String).void }
      attr_writer :user_prompt

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :web_search

      sig { params(web_search: T::Boolean).void }
      attr_writer :web_search

      sig do
        params(
          output_schema: T::Hash[Symbol, T.anything],
          type: Courier::JourneyAINode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          model: String,
          user_prompt: String,
          web_search: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
        output_schema:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        model: nil,
        user_prompt: nil,
        web_search: nil
      )
      end

      sig do
        override.returns(
          {
            output_schema: T::Hash[Symbol, T.anything],
            type: Courier::JourneyAINode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            model: String,
            user_prompt: String,
            web_search: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneyAINode::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AI = T.let(:ai, Courier::JourneyAINode::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::JourneyAINode::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end

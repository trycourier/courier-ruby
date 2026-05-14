# typed: strong

module Courier
  module Models
    class JourneyDelayUntilNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyDelayUntilNode, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::JourneyDelayUntilNode::Mode::OrSymbol) }
      attr_accessor :mode

      sig { returns(Courier::JourneyDelayUntilNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :until_

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

      sig do
        params(
          mode: Courier::JourneyDelayUntilNode::Mode::OrSymbol,
          type: Courier::JourneyDelayUntilNode::Type::OrSymbol,
          until_: String,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        mode:,
        type:,
        until_:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil
      )
      end

      sig do
        override.returns(
          {
            mode: Courier::JourneyDelayUntilNode::Mode::OrSymbol,
            type: Courier::JourneyDelayUntilNode::Type::OrSymbol,
            until_: String,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              )
          }
        )
      end
      def to_hash
      end

      module Mode
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneyDelayUntilNode::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        UNTIL =
          T.let(:until, Courier::JourneyDelayUntilNode::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyDelayUntilNode::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneyDelayUntilNode::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DELAY =
          T.let(:delay, Courier::JourneyDelayUntilNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyDelayUntilNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

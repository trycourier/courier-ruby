# typed: strong

module Courier
  module Models
    class JourneyDelayDurationNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyDelayDurationNode, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :duration

      sig { returns(Courier::JourneyDelayDurationNode::Mode::OrSymbol) }
      attr_accessor :mode

      sig { returns(Courier::JourneyDelayDurationNode::Type::OrSymbol) }
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

      sig do
        params(
          duration: String,
          mode: Courier::JourneyDelayDurationNode::Mode::OrSymbol,
          type: Courier::JourneyDelayDurationNode::Type::OrSymbol,
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
        duration:,
        mode:,
        type:,
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
            duration: String,
            mode: Courier::JourneyDelayDurationNode::Mode::OrSymbol,
            type: Courier::JourneyDelayDurationNode::Type::OrSymbol,
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
          T.type_alias do
            T.all(Symbol, Courier::JourneyDelayDurationNode::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DURATION =
          T.let(
            :duration,
            Courier::JourneyDelayDurationNode::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyDelayDurationNode::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyDelayDurationNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DELAY =
          T.let(:delay, Courier::JourneyDelayDurationNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyDelayDurationNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

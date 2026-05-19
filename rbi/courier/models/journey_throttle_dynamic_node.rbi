# typed: strong

module Courier
  module Models
    class JourneyThrottleDynamicNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyThrottleDynamicNode, Courier::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :max_allowed

      sig { returns(String) }
      attr_accessor :period

      sig { returns(Courier::JourneyThrottleDynamicNode::Scope::OrSymbol) }
      attr_accessor :scope

      sig { returns(String) }
      attr_accessor :throttle_key

      sig { returns(Courier::JourneyThrottleDynamicNode::Type::OrSymbol) }
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

      # Throttle the journey by a dynamic `throttle_key`, allowing at most `max_allowed`
      # invocations per `period`.
      sig do
        params(
          max_allowed: Integer,
          period: String,
          scope: Courier::JourneyThrottleDynamicNode::Scope::OrSymbol,
          throttle_key: String,
          type: Courier::JourneyThrottleDynamicNode::Type::OrSymbol,
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
        max_allowed:,
        period:,
        scope:,
        throttle_key:,
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
            max_allowed: Integer,
            period: String,
            scope: Courier::JourneyThrottleDynamicNode::Scope::OrSymbol,
            throttle_key: String,
            type: Courier::JourneyThrottleDynamicNode::Type::OrSymbol,
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

      module Scope
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyThrottleDynamicNode::Scope)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DYNAMIC =
          T.let(
            :dynamic,
            Courier::JourneyThrottleDynamicNode::Scope::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyThrottleDynamicNode::Scope::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyThrottleDynamicNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        THROTTLE =
          T.let(
            :throttle,
            Courier::JourneyThrottleDynamicNode::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyThrottleDynamicNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

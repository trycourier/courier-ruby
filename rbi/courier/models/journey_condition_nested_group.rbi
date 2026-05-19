# typed: strong

module Courier
  module Models
    class JourneyConditionNestedGroup < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneyConditionNestedGroup,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Array[Courier::JourneyConditionGroup])) }
      attr_reader :and_

      sig do
        params(and_: T::Array[Courier::JourneyConditionGroup::OrHash]).void
      end
      attr_writer :and_

      sig { returns(T.nilable(T::Array[Courier::JourneyConditionGroup])) }
      attr_reader :or_

      sig { params(or_: T::Array[Courier::JourneyConditionGroup::OrHash]).void }
      attr_writer :or_

      # A nested condition group. Exactly one of `AND` or `OR` must be present at
      # runtime; each is a list of `JourneyConditionGroup` items.
      sig do
        params(
          and_: T::Array[Courier::JourneyConditionGroup::OrHash],
          or_: T::Array[Courier::JourneyConditionGroup::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(and_: nil, or_: nil)
      end

      sig do
        override.returns(
          {
            and_: T::Array[Courier::JourneyConditionGroup],
            or_: T::Array[Courier::JourneyConditionGroup]
          }
        )
      end
      def to_hash
      end
    end
  end
end

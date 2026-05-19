# typed: strong

module Courier
  module Models
    class JourneyConditionGroup < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyConditionGroup, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      attr_reader :and_

      sig { params(and_: T::Array[T::Array[String]]).void }
      attr_writer :and_

      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      attr_reader :or_

      sig { params(or_: T::Array[T::Array[String]]).void }
      attr_writer :or_

      # A leaf condition group. Exactly one of `AND` or `OR` must be present at runtime;
      # each is a list of `JourneyConditionAtom` tuples.
      sig do
        params(
          and_: T::Array[T::Array[String]],
          or_: T::Array[T::Array[String]]
        ).returns(T.attached_class)
      end
      def self.new(and_: nil, or_: nil)
      end

      sig do
        override.returns(
          { and_: T::Array[T::Array[String]], or_: T::Array[T::Array[String]] }
        )
      end
      def to_hash
      end
    end
  end
end

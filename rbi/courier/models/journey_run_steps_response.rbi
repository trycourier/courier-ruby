# typed: strong

module Courier
  module Models
    class JourneyRunStepsResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyRunStepsResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::JourneyRunStep]) }
      attr_accessor :steps

      # Every step of a Journey run. Not paginated.
      sig do
        params(steps: T::Array[Courier::JourneyRunStep::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(steps:)
      end

      sig { override.returns({ steps: T::Array[Courier::JourneyRunStep] }) }
      def to_hash
      end
    end
  end
end

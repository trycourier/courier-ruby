# typed: strong

module Courier
  module Models
    class AutomationRunStepsResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::AutomationRunStepsResponse, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::AutomationRunStep]) }
      attr_accessor :steps

      # Every step of an Automation run. Not paginated.
      sig do
        params(steps: T::Array[Courier::AutomationRunStep::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(steps:)
      end

      sig { override.returns({ steps: T::Array[Courier::AutomationRunStep] }) }
      def to_hash
      end
    end
  end
end

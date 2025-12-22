# typed: strong

module Trycourier
  module Models
    class Pagerduty < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::Pagerduty, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :event_action

      sig { returns(T.nilable(String)) }
      attr_accessor :routing_key

      sig { returns(T.nilable(String)) }
      attr_accessor :severity

      sig { returns(T.nilable(String)) }
      attr_accessor :source

      sig do
        params(
          event_action: T.nilable(String),
          routing_key: T.nilable(String),
          severity: T.nilable(String),
          source: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        event_action: nil,
        routing_key: nil,
        severity: nil,
        source: nil
      )
      end

      sig do
        override.returns(
          {
            event_action: T.nilable(String),
            routing_key: T.nilable(String),
            severity: T.nilable(String),
            source: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end

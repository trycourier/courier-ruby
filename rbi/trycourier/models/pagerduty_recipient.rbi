# typed: strong

module Trycourier
  module Models
    class PagerdutyRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::PagerdutyRecipient, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::Pagerduty) }
      attr_reader :pagerduty

      sig { params(pagerduty: Trycourier::Pagerduty::OrHash).void }
      attr_writer :pagerduty

      # Send via PagerDuty
      sig do
        params(pagerduty: Trycourier::Pagerduty::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(pagerduty:)
      end

      sig { override.returns({ pagerduty: Trycourier::Pagerduty }) }
      def to_hash
      end
    end
  end
end

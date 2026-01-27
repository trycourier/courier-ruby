# typed: strong

module Courier
  module Models
    class PagerdutyRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PagerdutyRecipient, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::Pagerduty) }
      attr_reader :pagerduty

      sig { params(pagerduty: Courier::Pagerduty::OrHash).void }
      attr_writer :pagerduty

      # Send via PagerDuty
      sig do
        params(pagerduty: Courier::Pagerduty::OrHash).returns(T.attached_class)
      end
      def self.new(pagerduty:)
      end

      sig { override.returns({ pagerduty: Courier::Pagerduty }) }
      def to_hash
      end
    end
  end
end

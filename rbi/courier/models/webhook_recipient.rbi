# typed: strong

module Courier
  module Models
    class WebhookRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::WebhookRecipient, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::WebhookProfile) }
      attr_reader :webhook

      sig { params(webhook: Courier::WebhookProfile::OrHash).void }
      attr_writer :webhook

      # Send via webhook
      sig do
        params(webhook: Courier::WebhookProfile::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(webhook:)
      end

      sig { override.returns({ webhook: Courier::WebhookProfile }) }
      def to_hash
      end
    end
  end
end

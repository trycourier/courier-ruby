# typed: strong

module Trycourier
  module Models
    class WebhookRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::WebhookRecipient, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::WebhookProfile) }
      attr_reader :webhook

      sig { params(webhook: Trycourier::WebhookProfile::OrHash).void }
      attr_writer :webhook

      # Send via webhook
      sig do
        params(webhook: Trycourier::WebhookProfile::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(webhook:)
      end

      sig { override.returns({ webhook: Trycourier::WebhookProfile }) }
      def to_hash
      end
    end
  end
end

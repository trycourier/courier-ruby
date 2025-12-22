# frozen_string_literal: true

module Trycourier
  module Models
    class WebhookRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute webhook
      #
      #   @return [Trycourier::Models::WebhookProfile]
      required :webhook, -> { Trycourier::WebhookProfile }

      # @!method initialize(webhook:)
      #   Send via webhook
      #
      #   @param webhook [Trycourier::Models::WebhookProfile]
    end
  end
end

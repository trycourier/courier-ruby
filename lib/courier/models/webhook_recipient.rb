# frozen_string_literal: true

module Courier
  module Models
    class WebhookRecipient < Courier::Internal::Type::BaseModel
      # @!attribute webhook
      #
      #   @return [Courier::Models::WebhookProfile]
      required :webhook, -> { Courier::WebhookProfile }

      # @!method initialize(webhook:)
      #   Send via webhook
      #
      #   @param webhook [Courier::Models::WebhookProfile]
    end
  end
end

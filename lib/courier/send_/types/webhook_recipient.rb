# frozen_string_literal: true

module Courier
  module Send
    module Types
      class WebhookRecipient < Internal::Types::Model
        field :webhook, -> { Courier::Profiles::Types::WebhookProfile }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BaseMessageSendTo < Internal::Types::Model
        field :to, -> { Courier::Send::Types::MessageRecipient }, optional: true, nullable: false
      end
    end
  end
end

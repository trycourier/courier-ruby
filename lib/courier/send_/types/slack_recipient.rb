# frozen_string_literal: true

module Courier
  module Send
    module Types
      class SlackRecipient < Internal::Types::Model
        field :slack, -> { Courier::Profiles::Types::Slack }, optional: false, nullable: false
      end
    end
  end
end

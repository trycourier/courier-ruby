# frozen_string_literal: true

module Courier
  module Send
    module Types
      class PagerdutyRecipient < Internal::Types::Model
        field :pagerduty, -> { Courier::Profiles::Types::Pagerduty }, optional: false, nullable: false
      end
    end
  end
end

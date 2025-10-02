# frozen_string_literal: true

module Courier
  module Send
    module Types
      module Criteria
        extend Courier::Internal::Types::Enum

        NO_ESCALATION = "no-escalation"
        DELIVERED = "delivered"
        VIEWED = "viewed"
        ENGAGED = "engaged"
      end
    end
  end
end

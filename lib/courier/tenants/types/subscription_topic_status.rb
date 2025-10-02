# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      module SubscriptionTopicStatus
        extend Courier::Internal::Types::Enum

        OPTED_OUT = "OPTED_OUT"
        OPTED_IN = "OPTED_IN"
        REQUIRED = "REQUIRED"
      end
    end
  end
end

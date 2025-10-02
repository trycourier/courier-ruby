# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      module MessageRoutingMethod
        extend Courier::Internal::Types::Enum

        ALL = "all"
        SINGLE = "single"
      end
    end
  end
end

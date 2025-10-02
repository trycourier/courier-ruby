# frozen_string_literal: true

module Courier
  module Send
    module Types
      module RoutingMethod
        extend Courier::Internal::Types::Enum

        ALL = "all"
        SINGLE = "single"
      end
    end
  end
end

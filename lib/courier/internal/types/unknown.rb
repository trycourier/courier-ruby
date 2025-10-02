# frozen_string_literal: true

module Courier
  module Internal
    module Types
      module Unknown
        include Courier::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      # The operator to use for filtering
      class NestedFilterConfig < Internal::Types::Model
        field :rules, lambda {
          Internal::Types::Array[Courier::Audiences::Types::FilterConfig]
        }, optional: false, nullable: false
      end
    end
  end
end

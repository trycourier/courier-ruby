# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class MessageDetailsExtended < Internal::Types::Model
        field :providers, lambda {
          Internal::Types::Array[Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]]
        }, optional: true, nullable: false
      end
    end
  end
end

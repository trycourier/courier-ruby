# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class MessageHistoryResponse < Internal::Types::Model
        field :results, lambda {
          Internal::Types::Array[Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]]
        }, optional: false, nullable: false
      end
    end
  end
end

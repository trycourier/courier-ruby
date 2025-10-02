# frozen_string_literal: true

module Courier
  module Send
    module Types
      class ListPatternRecipient < Internal::Types::Model
        field :list_pattern, -> { String }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
      end
    end
  end
end

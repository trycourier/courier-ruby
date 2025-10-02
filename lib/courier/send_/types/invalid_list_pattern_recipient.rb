# frozen_string_literal: true

module Courier
  module Send
    module Types
      class InvalidListPatternRecipient < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
        field :list_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end

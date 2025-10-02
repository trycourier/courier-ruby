# frozen_string_literal: true

module Courier
  module Send
    module Types
      class InvalidUserRecipient < Internal::Types::Model
        field :list_id, -> { String }, optional: false, nullable: false
        field :list_pattern, -> { String }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Send
    module Types
      class InvalidListRecipient < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
        field :list_pattern, -> { String }, optional: false, nullable: false
      end
    end
  end
end

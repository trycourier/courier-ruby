# frozen_string_literal: true

module Courier
  module Send
    module Types
      class Locale < Internal::Types::Model
        field :content, -> { String }, optional: false, nullable: false
      end
    end
  end
end

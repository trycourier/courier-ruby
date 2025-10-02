# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BaseSocialPresence < Internal::Types::Model
        field :url, -> { String }, optional: false, nullable: false
      end
    end
  end
end

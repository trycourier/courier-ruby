# frozen_string_literal: true

module Courier
  module Send
    module Types
      module TextStyle
        extend Courier::Internal::Types::Enum

        TEXT = "text"
        H_1 = "h1"
        H_2 = "h2"
        SUBTEXT = "subtext"
      end
    end
  end
end

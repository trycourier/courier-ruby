# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Allows you to group elements together. This can be useful when used in combination with "if" or "loop". See [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
      class ElementalGroupNode < Internal::Types::Model
        field :elements, lambda {
          Internal::Types::Array[Courier::Send::Types::ElementalNode]
        }, optional: false, nullable: false
      end
    end
  end
end

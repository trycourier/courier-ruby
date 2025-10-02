# frozen_string_literal: true

module Courier
  module Messages
    module Types
      class RenderOutputResponse < Internal::Types::Model
        field :results, lambda {
          Internal::Types::Array[Courier::Messages::Types::RenderOutput]
        }, optional: false, nullable: false
      end
    end
  end
end

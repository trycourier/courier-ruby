# frozen_string_literal: true

module Courier
  module Audiences
    module Types
      class BaseFilterConfig < Internal::Types::Model
        field :operator, -> { Courier::Audiences::Types::Operator }, optional: false, nullable: false
      end
    end
  end
end

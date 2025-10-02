# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class Token < Internal::Types::Model
        field :token, -> { String }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class PatchOperation < Internal::Types::Model
          field :op, -> { String }, optional: false, nullable: false
          field :path, -> { String }, optional: false, nullable: false
          field :value, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

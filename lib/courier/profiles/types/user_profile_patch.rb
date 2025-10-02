# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class UserProfilePatch < Internal::Types::Model
        field :op, -> { String }, optional: false, nullable: false
        field :path, -> { String }, optional: false, nullable: false
        field :value, -> { String }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class ProfileUpdateRequest < Internal::Types::Model
        field :patch, lambda {
          Internal::Types::Array[Courier::Profiles::Types::UserProfilePatch]
        }, optional: false, nullable: false
      end
    end
  end
end

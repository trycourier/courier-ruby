# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class AirshipProfileAudience < Internal::Types::Model
        field :named_user, -> { String }, optional: false, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class ProfileGetParameters < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end

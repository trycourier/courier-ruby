# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class MergeProfileRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
        field :profile, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: false, nullable: false
      end
    end
  end
end

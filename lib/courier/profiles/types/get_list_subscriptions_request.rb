# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class GetListSubscriptionsRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end

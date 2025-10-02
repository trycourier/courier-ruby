# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class DeleteListSubscriptionResponse < Internal::Types::Model
        field :status, -> { String }, optional: false, nullable: false
      end
    end
  end
end

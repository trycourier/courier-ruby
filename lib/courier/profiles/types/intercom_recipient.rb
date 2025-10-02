# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class IntercomRecipient < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end

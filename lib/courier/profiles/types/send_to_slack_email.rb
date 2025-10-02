# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SendToSlackEmail < Internal::Types::Model
        field :email, -> { String }, optional: false, nullable: false
      end
    end
  end
end

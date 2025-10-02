# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class SlackBaseProperties < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end

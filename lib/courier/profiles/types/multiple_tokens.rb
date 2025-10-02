# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class MultipleTokens < Internal::Types::Model
        field :tokens, -> { Internal::Types::Array[Courier::Profiles::Types::Token] }, optional: false, nullable: false
      end
    end
  end
end

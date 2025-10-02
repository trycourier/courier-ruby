# frozen_string_literal: true

module Courier
  module AuthTokens
    module Types
      class IssueTokenParams < Internal::Types::Model
        field :scope, -> { String }, optional: false, nullable: false
        field :expires_in, -> { String }, optional: false, nullable: false
      end
    end
  end
end

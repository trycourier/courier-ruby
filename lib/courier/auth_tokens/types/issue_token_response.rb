# frozen_string_literal: true

module Courier
  module AuthTokens
    module Types
      class IssueTokenResponse < Internal::Types::Model
        field :token, -> { String }, optional: true, nullable: false
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class GetUserTokenResponse < Internal::Types::Model
          field :status, -> { Courier::Users::Tokens::Types::TokenStatus }, optional: true, nullable: false
          field :status_reason, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

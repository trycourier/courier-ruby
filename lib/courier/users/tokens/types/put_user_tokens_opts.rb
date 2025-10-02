# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class PutUserTokensOpts < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :tokens, lambda {
            Internal::Types::Array[Courier::Users::Tokens::Types::UserToken]
          }, optional: false, nullable: false
        end
      end
    end
  end
end

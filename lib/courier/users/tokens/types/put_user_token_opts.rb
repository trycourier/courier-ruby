# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class PutUserTokenOpts < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :token, -> { Courier::Users::Tokens::Types::UserToken }, optional: false, nullable: false
        end
      end
    end
  end
end

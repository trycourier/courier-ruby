# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class DeleteUserTokenOpts < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :token, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end

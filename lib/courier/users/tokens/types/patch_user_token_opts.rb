# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        class PatchUserTokenOpts < Internal::Types::Model
          field :patch, lambda {
            Internal::Types::Array[Courier::Users::Tokens::Types::PatchOperation]
          }, optional: false, nullable: false
        end
      end
    end
  end
end

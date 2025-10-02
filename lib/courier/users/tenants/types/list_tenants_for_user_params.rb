# frozen_string_literal: true

module Courier
  module Users
    module Tenants
      module Types
        class ListTenantsForUserParams < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end

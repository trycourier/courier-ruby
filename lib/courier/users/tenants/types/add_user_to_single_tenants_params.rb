# frozen_string_literal: true

module Courier
  module Users
    module Tenants
      module Types
        class AddUserToSingleTenantsParams < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :tenant_id, -> { String }, optional: false, nullable: false
          field :profile, lambda {
            Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
          }, optional: true, nullable: false
        end
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Users
    module Tenants
      module Types
        class AddUserToMultipleTenantsParams < Internal::Types::Model
          field :user_id, -> { String }, optional: false, nullable: false
          field :tenants, lambda {
            Internal::Types::Array[Courier::Commons::Types::UserTenantAssociation]
          }, optional: false, nullable: false
        end
      end
    end
  end
end

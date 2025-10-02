# frozen_string_literal: true

module Courier
  module Users
    module Tenants
      module Types
        # AddUserToSingleTenantsParamsProfile is no longer used for Add a User to a Single Tenant
        class AddUserToSingleTenantsParamsProfile < Internal::Types::Model
          field :title, -> { String }, optional: false, nullable: false
          field :email, -> { String }, optional: false, nullable: false
          field :phone_number, -> { String }, optional: false, nullable: false
          field :locale, -> { String }, optional: false, nullable: false
          field :additional_fields, lambda {
            Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
          }, optional: false, nullable: false
        end
      end
    end
  end
end

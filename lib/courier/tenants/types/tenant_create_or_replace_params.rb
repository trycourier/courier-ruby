# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class TenantCreateOrReplaceParams < Internal::Types::Model
        field :tenant_id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :parent_tenant_id, -> { String }, optional: true, nullable: false
        field :default_preferences, -> { Courier::Tenants::Types::DefaultPreferences }, optional: true, nullable: false
        field :properties, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :user_profile, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :brand_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end

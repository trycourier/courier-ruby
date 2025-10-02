# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class ListTenantParams < Internal::Types::Model
        field :parent_tenant_id, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end

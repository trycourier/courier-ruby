# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class GetTemplateListByTenantParams < Internal::Types::Model
        field :tenant_id, -> { String }, optional: false, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end

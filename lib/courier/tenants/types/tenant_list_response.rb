# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class TenantListResponse < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :items, -> { Internal::Types::Array[Courier::Tenants::Types::Tenant] }, optional: false, nullable: false
        field :next_url, -> { String }, optional: true, nullable: false
        field :url, -> { String }, optional: false, nullable: false
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end

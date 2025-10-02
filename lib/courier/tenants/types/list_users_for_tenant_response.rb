# frozen_string_literal: true

module Courier
  module Tenants
    module Types
      class ListUsersForTenantResponse < Internal::Types::Model
        field :items, lambda {
          Internal::Types::Array[Courier::Commons::Types::UserTenantAssociation]
        }, optional: true, nullable: false
        field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :url, -> { String }, optional: false, nullable: false
        field :next_url, -> { String }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :type, -> { String }, optional: false, nullable: false
      end
    end
  end
end

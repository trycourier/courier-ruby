# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class ListTemplateTenantAssociation < Internal::Types::Model
        field :data, -> { Courier::Commons::Types::TenantTemplateDataNoContent }, optional: false, nullable: false
      end
    end
  end
end

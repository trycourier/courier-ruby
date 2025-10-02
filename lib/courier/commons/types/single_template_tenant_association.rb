# frozen_string_literal: true

module Courier
  module Commons
    module Types
      class SingleTemplateTenantAssociation < Internal::Types::Model
        field :data, -> { Courier::Commons::Types::TenantTemplateData }, optional: false, nullable: false
      end
    end
  end
end

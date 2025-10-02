# frozen_string_literal: true

module Courier
  module Commons
    module Types
      # The template's data containing it's routing configs and Elemental content
      class TenantTemplateData < Internal::Types::Model
        field :routing, -> { Courier::Notifications::Types::MessageRouting }, optional: false, nullable: false
        field :content, -> { Courier::Send::Types::ElementalContent }, optional: false, nullable: false
      end
    end
  end
end

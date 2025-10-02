# frozen_string_literal: true

module Courier
  module Commons
    module Types
      # The template's data containing it's routing configs
      class TenantTemplateDataNoContent < Internal::Types::Model
        field :routing, -> { Courier::Notifications::Types::MessageRouting }, optional: false, nullable: false
      end
    end
  end
end

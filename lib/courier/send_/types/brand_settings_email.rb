# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BrandSettingsEmail < Internal::Types::Model
        field :template_override, -> { Courier::Send::Types::BrandTemplateOverride }, optional: true, nullable: false
        field :head, -> { Courier::Send::Types::EmailHead }, optional: true, nullable: false
        field :footer, -> { Courier::Send::Types::EmailFooter }, optional: true, nullable: false
        field :header, -> { Courier::Send::Types::EmailHeader }, optional: true, nullable: false
      end
    end
  end
end

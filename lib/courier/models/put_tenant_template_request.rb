# frozen_string_literal: true

module Courier
  module Models
    class PutTenantTemplateRequest < Courier::Internal::Type::BaseModel
      # @!attribute template
      #   Template configuration for creating or updating a tenant notification template
      #
      #   @return [Courier::Models::TenantTemplateInput]
      required :template, -> { Courier::TenantTemplateInput }

      # @!attribute published
      #   Whether to publish the template immediately after saving. When true, the
      #   template becomes the active/published version. When false (default), the
      #   template is saved as a draft.
      #
      #   @return [Boolean, nil]
      optional :published, Courier::Internal::Type::Boolean

      # @!method initialize(template:, published: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PutTenantTemplateRequest} for more details.
      #
      #   Request body for creating or updating a tenant notification template
      #
      #   @param template [Courier::Models::TenantTemplateInput] Template configuration for creating or updating a tenant notification template
      #
      #   @param published [Boolean] Whether to publish the template immediately after saving. When true, the templat
    end
  end
end

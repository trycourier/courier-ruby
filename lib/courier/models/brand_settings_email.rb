# frozen_string_literal: true

module Courier
  module Models
    class BrandSettingsEmail < Courier::Internal::Type::BaseModel
      # @!attribute footer
      #
      #   @return [Courier::Models::EmailFooter, nil]
      optional :footer, -> { Courier::EmailFooter }, nil?: true

      # @!attribute head
      #
      #   @return [Courier::Models::EmailHead, nil]
      optional :head, -> { Courier::EmailHead }, nil?: true

      # @!attribute header
      #
      #   @return [Courier::Models::EmailHeader, nil]
      optional :header, -> { Courier::EmailHeader }, nil?: true

      # @!attribute template_override
      #
      #   @return [Courier::Models::BrandSettingsEmail::TemplateOverride, nil]
      optional :template_override,
               -> { Courier::BrandSettingsEmail::TemplateOverride },
               api_name: :templateOverride,
               nil?: true

      # @!method initialize(footer: nil, head: nil, header: nil, template_override: nil)
      #   @param footer [Courier::Models::EmailFooter, nil]
      #   @param head [Courier::Models::EmailHead, nil]
      #   @param header [Courier::Models::EmailHeader, nil]
      #   @param template_override [Courier::Models::BrandSettingsEmail::TemplateOverride, nil]

      # @see Courier::Models::BrandSettingsEmail#template_override
      class TemplateOverride < Courier::Models::BrandTemplate
        # @!attribute mjml
        #
        #   @return [Courier::Models::BrandTemplate]
        required :mjml, -> { Courier::BrandTemplate }

        # @!attribute footer_background_color
        #
        #   @return [String, nil]
        optional :footer_background_color, String, api_name: :footerBackgroundColor, nil?: true

        # @!attribute footer_full_width
        #
        #   @return [Boolean, nil]
        optional :footer_full_width, Courier::Internal::Type::Boolean, api_name: :footerFullWidth, nil?: true

        # @!method initialize(mjml:, footer_background_color: nil, footer_full_width: nil)
        #   @param mjml [Courier::Models::BrandTemplate]
        #   @param footer_background_color [String, nil]
        #   @param footer_full_width [Boolean, nil]
      end
    end
  end
end

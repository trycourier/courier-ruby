# frozen_string_literal: true

module Trycourier
  module Models
    class BrandSettingsEmail < Trycourier::Internal::Type::BaseModel
      # @!attribute footer
      #
      #   @return [Trycourier::Models::EmailFooter, nil]
      optional :footer, -> { Trycourier::EmailFooter }, nil?: true

      # @!attribute head
      #
      #   @return [Trycourier::Models::EmailHead, nil]
      optional :head, -> { Trycourier::EmailHead }, nil?: true

      # @!attribute header
      #
      #   @return [Trycourier::Models::EmailHeader, nil]
      optional :header, -> { Trycourier::EmailHeader }, nil?: true

      # @!attribute template_override
      #
      #   @return [Trycourier::Models::BrandSettingsEmail::TemplateOverride, nil]
      optional :template_override,
               -> { Trycourier::BrandSettingsEmail::TemplateOverride },
               api_name: :templateOverride,
               nil?: true

      # @!method initialize(footer: nil, head: nil, header: nil, template_override: nil)
      #   @param footer [Trycourier::Models::EmailFooter, nil]
      #   @param head [Trycourier::Models::EmailHead, nil]
      #   @param header [Trycourier::Models::EmailHeader, nil]
      #   @param template_override [Trycourier::Models::BrandSettingsEmail::TemplateOverride, nil]

      # @see Trycourier::Models::BrandSettingsEmail#template_override
      class TemplateOverride < Trycourier::Models::BrandTemplate
        # @!attribute mjml
        #
        #   @return [Trycourier::Models::BrandTemplate]
        required :mjml, -> { Trycourier::BrandTemplate }

        # @!attribute footer_background_color
        #
        #   @return [String, nil]
        optional :footer_background_color, String, api_name: :footerBackgroundColor, nil?: true

        # @!attribute footer_full_width
        #
        #   @return [Boolean, nil]
        optional :footer_full_width,
                 Trycourier::Internal::Type::Boolean,
                 api_name: :footerFullWidth,
                 nil?: true

        # @!method initialize(mjml:, footer_background_color: nil, footer_full_width: nil)
        #   @param mjml [Trycourier::Models::BrandTemplate]
        #   @param footer_background_color [String, nil]
        #   @param footer_full_width [Boolean, nil]
      end
    end
  end
end

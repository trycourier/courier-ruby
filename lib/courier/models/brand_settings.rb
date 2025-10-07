# frozen_string_literal: true

module Courier
  module Models
    class BrandSettings < Courier::Internal::Type::BaseModel
      # @!attribute colors
      #
      #   @return [Courier::Models::BrandSettings::Colors, nil]
      optional :colors, -> { Courier::BrandSettings::Colors }, nil?: true

      # @!attribute email
      #
      #   @return [Courier::Models::BrandSettings::Email, nil]
      optional :email, -> { Courier::BrandSettings::Email }, nil?: true

      # @!attribute inapp
      #
      #   @return [Courier::Models::BrandSettings::Inapp, nil]
      optional :inapp, -> { Courier::BrandSettings::Inapp }, nil?: true

      # @!method initialize(colors: nil, email: nil, inapp: nil)
      #   @param colors [Courier::Models::BrandSettings::Colors, nil]
      #   @param email [Courier::Models::BrandSettings::Email, nil]
      #   @param inapp [Courier::Models::BrandSettings::Inapp, nil]

      # @see Courier::Models::BrandSettings#colors
      class Colors < Courier::Internal::Type::BaseModel
        # @!attribute primary
        #
        #   @return [String, nil]
        optional :primary, String, nil?: true

        # @!attribute secondary
        #
        #   @return [String, nil]
        optional :secondary, String, nil?: true

        # @!method initialize(primary: nil, secondary: nil)
        #   @param primary [String, nil]
        #   @param secondary [String, nil]
      end

      # @see Courier::Models::BrandSettings#email
      class Email < Courier::Internal::Type::BaseModel
        # @!attribute footer
        #
        #   @return [Courier::Models::BrandSettings::Email::Footer, nil]
        optional :footer, -> { Courier::BrandSettings::Email::Footer }, nil?: true

        # @!attribute head
        #
        #   @return [Courier::Models::BrandSettings::Email::Head, nil]
        optional :head, -> { Courier::BrandSettings::Email::Head }, nil?: true

        # @!attribute header
        #
        #   @return [Courier::Models::BrandSettings::Email::Header, nil]
        optional :header, -> { Courier::BrandSettings::Email::Header }, nil?: true

        # @!attribute template_override
        #
        #   @return [Courier::Models::BrandSettings::Email::TemplateOverride, nil]
        optional :template_override,
                 -> { Courier::BrandSettings::Email::TemplateOverride },
                 api_name: :templateOverride,
                 nil?: true

        # @!method initialize(footer: nil, head: nil, header: nil, template_override: nil)
        #   @param footer [Courier::Models::BrandSettings::Email::Footer, nil]
        #   @param head [Courier::Models::BrandSettings::Email::Head, nil]
        #   @param header [Courier::Models::BrandSettings::Email::Header, nil]
        #   @param template_override [Courier::Models::BrandSettings::Email::TemplateOverride, nil]

        # @see Courier::Models::BrandSettings::Email#footer
        class Footer < Courier::Internal::Type::BaseModel
          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute inherit_default
          #
          #   @return [Boolean, nil]
          optional :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

          # @!method initialize(content: nil, inherit_default: nil)
          #   @param content [String, nil]
          #   @param inherit_default [Boolean, nil]
        end

        # @see Courier::Models::BrandSettings::Email#head
        class Head < Courier::Internal::Type::BaseModel
          # @!attribute inherit_default
          #
          #   @return [Boolean]
          required :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(inherit_default:, content: nil)
          #   @param inherit_default [Boolean]
          #   @param content [String, nil]
        end

        # @see Courier::Models::BrandSettings::Email#header
        class Header < Courier::Internal::Type::BaseModel
          # @!attribute logo
          #
          #   @return [Courier::Models::BrandSettings::Email::Header::Logo]
          required :logo, -> { Courier::BrandSettings::Email::Header::Logo }

          # @!attribute bar_color
          #
          #   @return [String, nil]
          optional :bar_color, String, api_name: :barColor, nil?: true

          # @!attribute inherit_default
          #
          #   @return [Boolean, nil]
          optional :inherit_default, Courier::Internal::Type::Boolean, api_name: :inheritDefault, nil?: true

          # @!method initialize(logo:, bar_color: nil, inherit_default: nil)
          #   @param logo [Courier::Models::BrandSettings::Email::Header::Logo]
          #   @param bar_color [String, nil]
          #   @param inherit_default [Boolean, nil]

          # @see Courier::Models::BrandSettings::Email::Header#logo
          class Logo < Courier::Internal::Type::BaseModel
            # @!attribute href
            #
            #   @return [String, nil]
            optional :href, String, nil?: true

            # @!attribute image
            #
            #   @return [String, nil]
            optional :image, String, nil?: true

            # @!method initialize(href: nil, image: nil)
            #   @param href [String, nil]
            #   @param image [String, nil]
          end
        end

        # @see Courier::Models::BrandSettings::Email#template_override
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
          optional :footer_full_width,
                   Courier::Internal::Type::Boolean,
                   api_name: :footerFullWidth,
                   nil?: true

          # @!method initialize(mjml:, footer_background_color: nil, footer_full_width: nil)
          #   @param mjml [Courier::Models::BrandTemplate]
          #   @param footer_background_color [String, nil]
          #   @param footer_full_width [Boolean, nil]
        end
      end

      # @see Courier::Models::BrandSettings#inapp
      class Inapp < Courier::Internal::Type::BaseModel
        # @!attribute colors
        #
        #   @return [Courier::Models::BrandSettings::Inapp::Colors]
        required :colors, -> { Courier::BrandSettings::Inapp::Colors }

        # @!attribute icons
        #
        #   @return [Courier::Models::BrandSettings::Inapp::Icons]
        required :icons, -> { Courier::BrandSettings::Inapp::Icons }

        # @!attribute widget_background
        #
        #   @return [Courier::Models::BrandSettings::Inapp::WidgetBackground]
        required :widget_background,
                 -> { Courier::BrandSettings::Inapp::WidgetBackground },
                 api_name: :widgetBackground

        # @!attribute border_radius
        #
        #   @return [String, nil]
        optional :border_radius, String, api_name: :borderRadius, nil?: true

        # @!attribute disable_message_icon
        #
        #   @return [Boolean, nil]
        optional :disable_message_icon,
                 Courier::Internal::Type::Boolean,
                 api_name: :disableMessageIcon,
                 nil?: true

        # @!attribute font_family
        #
        #   @return [String, nil]
        optional :font_family, String, api_name: :fontFamily, nil?: true

        # @!attribute placement
        #
        #   @return [Symbol, Courier::Models::BrandSettings::Inapp::Placement, nil]
        optional :placement, enum: -> { Courier::BrandSettings::Inapp::Placement }, nil?: true

        # @!method initialize(colors:, icons:, widget_background:, border_radius: nil, disable_message_icon: nil, font_family: nil, placement: nil)
        #   @param colors [Courier::Models::BrandSettings::Inapp::Colors]
        #   @param icons [Courier::Models::BrandSettings::Inapp::Icons]
        #   @param widget_background [Courier::Models::BrandSettings::Inapp::WidgetBackground]
        #   @param border_radius [String, nil]
        #   @param disable_message_icon [Boolean, nil]
        #   @param font_family [String, nil]
        #   @param placement [Symbol, Courier::Models::BrandSettings::Inapp::Placement, nil]

        # @see Courier::Models::BrandSettings::Inapp#colors
        class Colors < Courier::Internal::Type::BaseModel
          # @!attribute primary
          #
          #   @return [String, nil]
          optional :primary, String, nil?: true

          # @!attribute secondary
          #
          #   @return [String, nil]
          optional :secondary, String, nil?: true

          # @!method initialize(primary: nil, secondary: nil)
          #   @param primary [String, nil]
          #   @param secondary [String, nil]
        end

        # @see Courier::Models::BrandSettings::Inapp#icons
        class Icons < Courier::Internal::Type::BaseModel
          # @!attribute bell
          #
          #   @return [String, nil]
          optional :bell, String, nil?: true

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String, nil?: true

          # @!method initialize(bell: nil, message: nil)
          #   @param bell [String, nil]
          #   @param message [String, nil]
        end

        # @see Courier::Models::BrandSettings::Inapp#widget_background
        class WidgetBackground < Courier::Internal::Type::BaseModel
          # @!attribute bottom_color
          #
          #   @return [String, nil]
          optional :bottom_color, String, api_name: :bottomColor, nil?: true

          # @!attribute top_color
          #
          #   @return [String, nil]
          optional :top_color, String, api_name: :topColor, nil?: true

          # @!method initialize(bottom_color: nil, top_color: nil)
          #   @param bottom_color [String, nil]
          #   @param top_color [String, nil]
        end

        # @see Courier::Models::BrandSettings::Inapp#placement
        module Placement
          extend Courier::Internal::Type::Enum

          TOP = :top
          BOTTOM = :bottom
          LEFT = :left
          RIGHT = :right

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end

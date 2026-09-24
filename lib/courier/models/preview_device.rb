# frozen_string_literal: true

module Courier
  module Models
    class PreviewDevice < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   The device's identifier, used in `device_ids` when creating a device set or a
      #   run.
      #
      #   @return [String]
      required :id, String

      # @!attribute app
      #   The mail app. For webmail it is the service (`outlook_com`, `gmail_com`); for
      #   mobile the app (`apple_mail`, `gmail`); for desktop the app together with the
      #   version it is sold under (`outlook_2019`, `outlook_microsoft_365`,
      #   `apple_mail_16`), because that version is what separates one desktop Outlook
      #   from another.
      #
      #   @return [String]
      required :app, String

      # @!attribute category
      #   Where the app runs.
      #
      #   @return [Symbol, Courier::Models::PreviewDevice::Category]
      required :category, enum: -> { Courier::PreviewDevice::Category }

      # @!attribute name
      #   Display name. Render it as-is rather than parsing it. It is also what separates
      #   the two 120-dpi Outlook renders from their 100% siblings, which are otherwise
      #   identical field for field.
      #
      #   @return [String]
      required :name, String

      # @!attribute os
      #   The operating system.
      #
      #   @return [String]
      required :os, String

      # @!attribute os_version
      #   The operating system's version. Always set.
      #
      #   @return [String]
      required :os_version, String

      # @!attribute platform
      #   What the app runs on — the browser for webmail (`chrome`, `edge`, `firefox`),
      #   the phone for mobile (`iphone`, `pixel`). Null for desktop, where the app runs
      #   on nothing but the OS.
      #
      #   @return [String, nil]
      required :platform, String, nil?: true

      # @!attribute platform_version
      #   Which one of the platform — the phone model for mobile (`15_pro_max`, `10`).
      #   Null for webmail, which always renders in the current browser, and for desktop.
      #
      #   @return [String, nil]
      required :platform_version, String, nil?: true

      # @!attribute theme
      #   Whether the email is rendered in light or dark mode.
      #
      #   @return [Symbol, Courier::Models::PreviewDevice::Theme]
      required :theme, enum: -> { Courier::PreviewDevice::Theme }

      # @!method initialize(id:, app:, category:, name:, os:, os_version:, platform:, platform_version:, theme:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::PreviewDevice} for more details.
      #
      #   One mail app on one platform, operating system and theme that a preview can be
      #   rendered on. Reference data, identical for every workspace. Every field is
      #   always present; `platform` and `platform_version` are null where they do not
      #   apply.
      #
      #   @param id [String] The device's identifier, used in `device_ids` when creating a device set or a ru
      #
      #   @param app [String] The mail app. For webmail it is the service (`outlook_com`, `gmail_com`); for mo
      #
      #   @param category [Symbol, Courier::Models::PreviewDevice::Category] Where the app runs.
      #
      #   @param name [String] Display name. Render it as-is rather than parsing it. It is also what separates
      #
      #   @param os [String] The operating system.
      #
      #   @param os_version [String] The operating system's version. Always set.
      #
      #   @param platform [String, nil] What the app runs on — the browser for webmail (`chrome`, `edge`, `firefox`), th
      #
      #   @param platform_version [String, nil] Which one of the platform — the phone model for mobile (`15_pro_max`, `10`). Nul
      #
      #   @param theme [Symbol, Courier::Models::PreviewDevice::Theme] Whether the email is rendered in light or dark mode.

      # Where the app runs.
      #
      # @see Courier::Models::PreviewDevice#category
      module Category
        extend Courier::Internal::Type::Enum

        WEBMAIL = :webmail
        MOBILE = :mobile
        DESKTOP = :desktop

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether the email is rendered in light or dark mode.
      #
      # @see Courier::Models::PreviewDevice#theme
      module Theme
        extend Courier::Internal::Type::Enum

        LIGHT = :light
        DARK = :dark

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

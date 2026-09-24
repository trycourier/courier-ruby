# typed: strong

module Courier
  module Models
    class PreviewDevice < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PreviewDevice, Courier::Internal::AnyHash)
        end

      # The device's identifier, used in `device_ids` when creating a device set or a
      # run.
      sig { returns(String) }
      attr_accessor :id

      # The mail app. For webmail it is the service (`outlook_com`, `gmail_com`); for
      # mobile the app (`apple_mail`, `gmail`); for desktop the app together with the
      # version it is sold under (`outlook_2019`, `outlook_microsoft_365`,
      # `apple_mail_16`), because that version is what separates one desktop Outlook
      # from another.
      sig { returns(String) }
      attr_accessor :app

      # Where the app runs.
      sig { returns(Courier::PreviewDevice::Category::TaggedSymbol) }
      attr_accessor :category

      # Display name. Render it as-is rather than parsing it. It is also what separates
      # the two 120-dpi Outlook renders from their 100% siblings, which are otherwise
      # identical field for field.
      sig { returns(String) }
      attr_accessor :name

      # The operating system.
      sig { returns(String) }
      attr_accessor :os

      # The operating system's version. Always set.
      sig { returns(String) }
      attr_accessor :os_version

      # What the app runs on — the browser for webmail (`chrome`, `edge`, `firefox`),
      # the phone for mobile (`iphone`, `pixel`). Null for desktop, where the app runs
      # on nothing but the OS.
      sig { returns(T.nilable(String)) }
      attr_accessor :platform

      # Which one of the platform — the phone model for mobile (`15_pro_max`, `10`).
      # Null for webmail, which always renders in the current browser, and for desktop.
      sig { returns(T.nilable(String)) }
      attr_accessor :platform_version

      # Whether the email is rendered in light or dark mode.
      sig { returns(Courier::PreviewDevice::Theme::TaggedSymbol) }
      attr_accessor :theme

      # One mail app on one platform, operating system and theme that a preview can be
      # rendered on. Reference data, identical for every workspace. Every field is
      # always present; `platform` and `platform_version` are null where they do not
      # apply.
      sig do
        params(
          id: String,
          app: String,
          category: Courier::PreviewDevice::Category::OrSymbol,
          name: String,
          os: String,
          os_version: String,
          platform: T.nilable(String),
          platform_version: T.nilable(String),
          theme: Courier::PreviewDevice::Theme::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The device's identifier, used in `device_ids` when creating a device set or a
        # run.
        id:,
        # The mail app. For webmail it is the service (`outlook_com`, `gmail_com`); for
        # mobile the app (`apple_mail`, `gmail`); for desktop the app together with the
        # version it is sold under (`outlook_2019`, `outlook_microsoft_365`,
        # `apple_mail_16`), because that version is what separates one desktop Outlook
        # from another.
        app:,
        # Where the app runs.
        category:,
        # Display name. Render it as-is rather than parsing it. It is also what separates
        # the two 120-dpi Outlook renders from their 100% siblings, which are otherwise
        # identical field for field.
        name:,
        # The operating system.
        os:,
        # The operating system's version. Always set.
        os_version:,
        # What the app runs on — the browser for webmail (`chrome`, `edge`, `firefox`),
        # the phone for mobile (`iphone`, `pixel`). Null for desktop, where the app runs
        # on nothing but the OS.
        platform:,
        # Which one of the platform — the phone model for mobile (`15_pro_max`, `10`).
        # Null for webmail, which always renders in the current browser, and for desktop.
        platform_version:,
        # Whether the email is rendered in light or dark mode.
        theme:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            app: String,
            category: Courier::PreviewDevice::Category::TaggedSymbol,
            name: String,
            os: String,
            os_version: String,
            platform: T.nilable(String),
            platform_version: T.nilable(String),
            theme: Courier::PreviewDevice::Theme::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Where the app runs.
      module Category
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::PreviewDevice::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEBMAIL =
          T.let(:webmail, Courier::PreviewDevice::Category::TaggedSymbol)
        MOBILE = T.let(:mobile, Courier::PreviewDevice::Category::TaggedSymbol)
        DESKTOP =
          T.let(:desktop, Courier::PreviewDevice::Category::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::PreviewDevice::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Whether the email is rendered in light or dark mode.
      module Theme
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::PreviewDevice::Theme) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIGHT = T.let(:light, Courier::PreviewDevice::Theme::TaggedSymbol)
        DARK = T.let(:dark, Courier::PreviewDevice::Theme::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::PreviewDevice::Theme::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end

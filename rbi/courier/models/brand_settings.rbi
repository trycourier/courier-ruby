# typed: strong

module Courier
  module Models
    class BrandSettings < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSettings, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Courier::BrandSettings::Colors)) }
      attr_reader :colors

      sig do
        params(colors: T.nilable(Courier::BrandSettings::Colors::OrHash)).void
      end
      attr_writer :colors

      sig { returns(T.nilable(Courier::BrandSettings::Email)) }
      attr_reader :email

      sig do
        params(email: T.nilable(Courier::BrandSettings::Email::OrHash)).void
      end
      attr_writer :email

      sig { returns(T.nilable(Courier::BrandSettings::Inapp)) }
      attr_reader :inapp

      sig do
        params(inapp: T.nilable(Courier::BrandSettings::Inapp::OrHash)).void
      end
      attr_writer :inapp

      sig do
        params(
          colors: T.nilable(Courier::BrandSettings::Colors::OrHash),
          email: T.nilable(Courier::BrandSettings::Email::OrHash),
          inapp: T.nilable(Courier::BrandSettings::Inapp::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(colors: nil, email: nil, inapp: nil)
      end

      sig do
        override.returns(
          {
            colors: T.nilable(Courier::BrandSettings::Colors),
            email: T.nilable(Courier::BrandSettings::Email),
            inapp: T.nilable(Courier::BrandSettings::Inapp)
          }
        )
      end
      def to_hash
      end

      class Colors < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BrandSettings::Colors, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :primary

        sig { returns(T.nilable(String)) }
        attr_accessor :secondary

        sig do
          params(
            primary: T.nilable(String),
            secondary: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(primary: nil, secondary: nil)
        end

        sig do
          override.returns(
            { primary: T.nilable(String), secondary: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Email < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BrandSettings::Email, Courier::Internal::AnyHash)
          end

        sig { returns(T.nilable(Courier::BrandSettings::Email::Footer)) }
        attr_reader :footer

        sig do
          params(
            footer: T.nilable(Courier::BrandSettings::Email::Footer::OrHash)
          ).void
        end
        attr_writer :footer

        sig { returns(T.nilable(Courier::BrandSettings::Email::Head)) }
        attr_reader :head

        sig do
          params(
            head: T.nilable(Courier::BrandSettings::Email::Head::OrHash)
          ).void
        end
        attr_writer :head

        sig { returns(T.nilable(Courier::BrandSettings::Email::Header)) }
        attr_reader :header

        sig do
          params(
            header: T.nilable(Courier::BrandSettings::Email::Header::OrHash)
          ).void
        end
        attr_writer :header

        sig do
          returns(T.nilable(Courier::BrandSettings::Email::TemplateOverride))
        end
        attr_reader :template_override

        sig do
          params(
            template_override:
              T.nilable(Courier::BrandSettings::Email::TemplateOverride::OrHash)
          ).void
        end
        attr_writer :template_override

        sig do
          params(
            footer: T.nilable(Courier::BrandSettings::Email::Footer::OrHash),
            head: T.nilable(Courier::BrandSettings::Email::Head::OrHash),
            header: T.nilable(Courier::BrandSettings::Email::Header::OrHash),
            template_override:
              T.nilable(Courier::BrandSettings::Email::TemplateOverride::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          footer: nil,
          head: nil,
          header: nil,
          template_override: nil
        )
        end

        sig do
          override.returns(
            {
              footer: T.nilable(Courier::BrandSettings::Email::Footer),
              head: T.nilable(Courier::BrandSettings::Email::Head),
              header: T.nilable(Courier::BrandSettings::Email::Header),
              template_override:
                T.nilable(Courier::BrandSettings::Email::TemplateOverride)
            }
          )
        end
        def to_hash
        end

        class Footer < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Email::Footer,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_default

          sig do
            params(
              content: T.nilable(String),
              inherit_default: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(content: nil, inherit_default: nil)
          end

          sig do
            override.returns(
              {
                content: T.nilable(String),
                inherit_default: T.nilable(T::Boolean)
              }
            )
          end
          def to_hash
          end
        end

        class Head < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Email::Head,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :inherit_default

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig do
            params(
              inherit_default: T::Boolean,
              content: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(inherit_default:, content: nil)
          end

          sig do
            override.returns(
              { inherit_default: T::Boolean, content: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        class Header < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Email::Header,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::BrandSettings::Email::Header::Logo) }
          attr_reader :logo

          sig do
            params(
              logo: Courier::BrandSettings::Email::Header::Logo::OrHash
            ).void
          end
          attr_writer :logo

          sig { returns(T.nilable(String)) }
          attr_accessor :bar_color

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_default

          sig do
            params(
              logo: Courier::BrandSettings::Email::Header::Logo::OrHash,
              bar_color: T.nilable(String),
              inherit_default: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(logo:, bar_color: nil, inherit_default: nil)
          end

          sig do
            override.returns(
              {
                logo: Courier::BrandSettings::Email::Header::Logo,
                bar_color: T.nilable(String),
                inherit_default: T.nilable(T::Boolean)
              }
            )
          end
          def to_hash
          end

          class Logo < Courier::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Courier::BrandSettings::Email::Header::Logo,
                  Courier::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :href

            sig { returns(T.nilable(String)) }
            attr_accessor :image

            sig do
              params(href: T.nilable(String), image: T.nilable(String)).returns(
                T.attached_class
              )
            end
            def self.new(href: nil, image: nil)
            end

            sig do
              override.returns(
                { href: T.nilable(String), image: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end

        class TemplateOverride < Courier::Models::BrandTemplate
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Email::TemplateOverride,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Courier::BrandTemplate) }
          attr_reader :mjml

          sig { params(mjml: Courier::BrandTemplate::OrHash).void }
          attr_writer :mjml

          sig { returns(T.nilable(String)) }
          attr_accessor :footer_background_color

          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :footer_full_width

          sig do
            params(
              mjml: Courier::BrandTemplate::OrHash,
              footer_background_color: T.nilable(String),
              footer_full_width: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(
            mjml:,
            footer_background_color: nil,
            footer_full_width: nil
          )
          end

          sig do
            override.returns(
              {
                mjml: Courier::BrandTemplate,
                footer_background_color: T.nilable(String),
                footer_full_width: T.nilable(T::Boolean)
              }
            )
          end
          def to_hash
          end
        end
      end

      class Inapp < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::BrandSettings::Inapp, Courier::Internal::AnyHash)
          end

        sig { returns(Courier::BrandSettings::Inapp::Colors) }
        attr_reader :colors

        sig do
          params(colors: Courier::BrandSettings::Inapp::Colors::OrHash).void
        end
        attr_writer :colors

        sig { returns(Courier::BrandSettings::Inapp::Icons) }
        attr_reader :icons

        sig { params(icons: Courier::BrandSettings::Inapp::Icons::OrHash).void }
        attr_writer :icons

        sig { returns(Courier::BrandSettings::Inapp::WidgetBackground) }
        attr_reader :widget_background

        sig do
          params(
            widget_background:
              Courier::BrandSettings::Inapp::WidgetBackground::OrHash
          ).void
        end
        attr_writer :widget_background

        sig { returns(T.nilable(String)) }
        attr_accessor :border_radius

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :disable_message_icon

        sig { returns(T.nilable(String)) }
        attr_accessor :font_family

        sig do
          returns(T.nilable(Courier::BrandSettings::Inapp::Placement::OrSymbol))
        end
        attr_accessor :placement

        sig do
          params(
            colors: Courier::BrandSettings::Inapp::Colors::OrHash,
            icons: Courier::BrandSettings::Inapp::Icons::OrHash,
            widget_background:
              Courier::BrandSettings::Inapp::WidgetBackground::OrHash,
            border_radius: T.nilable(String),
            disable_message_icon: T.nilable(T::Boolean),
            font_family: T.nilable(String),
            placement:
              T.nilable(Courier::BrandSettings::Inapp::Placement::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          colors:,
          icons:,
          widget_background:,
          border_radius: nil,
          disable_message_icon: nil,
          font_family: nil,
          placement: nil
        )
        end

        sig do
          override.returns(
            {
              colors: Courier::BrandSettings::Inapp::Colors,
              icons: Courier::BrandSettings::Inapp::Icons,
              widget_background:
                Courier::BrandSettings::Inapp::WidgetBackground,
              border_radius: T.nilable(String),
              disable_message_icon: T.nilable(T::Boolean),
              font_family: T.nilable(String),
              placement:
                T.nilable(Courier::BrandSettings::Inapp::Placement::OrSymbol)
            }
          )
        end
        def to_hash
        end

        class Colors < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Inapp::Colors,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :primary

          sig { returns(T.nilable(String)) }
          attr_accessor :secondary

          sig do
            params(
              primary: T.nilable(String),
              secondary: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(primary: nil, secondary: nil)
          end

          sig do
            override.returns(
              { primary: T.nilable(String), secondary: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        class Icons < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Inapp::Icons,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :bell

          sig { returns(T.nilable(String)) }
          attr_accessor :message

          sig do
            params(bell: T.nilable(String), message: T.nilable(String)).returns(
              T.attached_class
            )
          end
          def self.new(bell: nil, message: nil)
          end

          sig do
            override.returns(
              { bell: T.nilable(String), message: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        class WidgetBackground < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::BrandSettings::Inapp::WidgetBackground,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :bottom_color

          sig { returns(T.nilable(String)) }
          attr_accessor :top_color

          sig do
            params(
              bottom_color: T.nilable(String),
              top_color: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(bottom_color: nil, top_color: nil)
          end

          sig do
            override.returns(
              { bottom_color: T.nilable(String), top_color: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        module Placement
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::BrandSettings::Inapp::Placement)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOP =
            T.let(:top, Courier::BrandSettings::Inapp::Placement::TaggedSymbol)
          BOTTOM =
            T.let(
              :bottom,
              Courier::BrandSettings::Inapp::Placement::TaggedSymbol
            )
          LEFT =
            T.let(:left, Courier::BrandSettings::Inapp::Placement::TaggedSymbol)
          RIGHT =
            T.let(
              :right,
              Courier::BrandSettings::Inapp::Placement::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Courier::BrandSettings::Inapp::Placement::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end

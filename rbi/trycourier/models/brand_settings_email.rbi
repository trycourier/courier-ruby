# typed: strong

module Trycourier
  module Models
    class BrandSettingsEmail < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandSettingsEmail, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Trycourier::EmailFooter)) }
      attr_reader :footer

      sig { params(footer: T.nilable(Trycourier::EmailFooter::OrHash)).void }
      attr_writer :footer

      sig { returns(T.nilable(Trycourier::EmailHead)) }
      attr_reader :head

      sig { params(head: T.nilable(Trycourier::EmailHead::OrHash)).void }
      attr_writer :head

      sig { returns(T.nilable(Trycourier::EmailHeader)) }
      attr_reader :header

      sig { params(header: T.nilable(Trycourier::EmailHeader::OrHash)).void }
      attr_writer :header

      sig do
        returns(T.nilable(Trycourier::BrandSettingsEmail::TemplateOverride))
      end
      attr_reader :template_override

      sig do
        params(
          template_override:
            T.nilable(Trycourier::BrandSettingsEmail::TemplateOverride::OrHash)
        ).void
      end
      attr_writer :template_override

      sig do
        params(
          footer: T.nilable(Trycourier::EmailFooter::OrHash),
          head: T.nilable(Trycourier::EmailHead::OrHash),
          header: T.nilable(Trycourier::EmailHeader::OrHash),
          template_override:
            T.nilable(Trycourier::BrandSettingsEmail::TemplateOverride::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(footer: nil, head: nil, header: nil, template_override: nil)
      end

      sig do
        override.returns(
          {
            footer: T.nilable(Trycourier::EmailFooter),
            head: T.nilable(Trycourier::EmailHead),
            header: T.nilable(Trycourier::EmailHeader),
            template_override:
              T.nilable(Trycourier::BrandSettingsEmail::TemplateOverride)
          }
        )
      end
      def to_hash
      end

      class TemplateOverride < Trycourier::Models::BrandTemplate
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::BrandSettingsEmail::TemplateOverride,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(Trycourier::BrandTemplate) }
        attr_reader :mjml

        sig { params(mjml: Trycourier::BrandTemplate::OrHash).void }
        attr_writer :mjml

        sig { returns(T.nilable(String)) }
        attr_accessor :footer_background_color

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :footer_full_width

        sig do
          params(
            mjml: Trycourier::BrandTemplate::OrHash,
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
              mjml: Trycourier::BrandTemplate,
              footer_background_color: T.nilable(String),
              footer_full_width: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

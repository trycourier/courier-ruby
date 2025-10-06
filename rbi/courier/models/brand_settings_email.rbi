# typed: strong

module Courier
  module Models
    class BrandSettingsEmail < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSettingsEmail, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Courier::EmailFooter)) }
      attr_reader :footer

      sig { params(footer: T.nilable(Courier::EmailFooter::OrHash)).void }
      attr_writer :footer

      sig { returns(T.nilable(Courier::EmailHead)) }
      attr_reader :head

      sig { params(head: T.nilable(Courier::EmailHead::OrHash)).void }
      attr_writer :head

      sig { returns(T.nilable(Courier::EmailHeader)) }
      attr_reader :header

      sig { params(header: T.nilable(Courier::EmailHeader::OrHash)).void }
      attr_writer :header

      sig { returns(T.nilable(Courier::BrandSettingsEmail::TemplateOverride)) }
      attr_reader :template_override

      sig do
        params(
          template_override:
            T.nilable(Courier::BrandSettingsEmail::TemplateOverride::OrHash)
        ).void
      end
      attr_writer :template_override

      sig do
        params(
          footer: T.nilable(Courier::EmailFooter::OrHash),
          head: T.nilable(Courier::EmailHead::OrHash),
          header: T.nilable(Courier::EmailHeader::OrHash),
          template_override:
            T.nilable(Courier::BrandSettingsEmail::TemplateOverride::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(footer: nil, head: nil, header: nil, template_override: nil)
      end

      sig do
        override.returns(
          {
            footer: T.nilable(Courier::EmailFooter),
            head: T.nilable(Courier::EmailHead),
            header: T.nilable(Courier::EmailHeader),
            template_override:
              T.nilable(Courier::BrandSettingsEmail::TemplateOverride)
          }
        )
      end
      def to_hash
      end

      class TemplateOverride < Courier::Models::BrandTemplate
        OrHash =
          T.type_alias do
            T.any(
              Courier::BrandSettingsEmail::TemplateOverride,
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
  end
end

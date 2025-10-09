# typed: strong

module Trycourier
  module Models
    class BrandSettings < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::BrandSettings, Trycourier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Trycourier::BrandColors)) }
      attr_reader :colors

      sig { params(colors: T.nilable(Trycourier::BrandColors::OrHash)).void }
      attr_writer :colors

      sig { returns(T.nilable(Trycourier::BrandSettingsEmail)) }
      attr_reader :email

      sig do
        params(email: T.nilable(Trycourier::BrandSettingsEmail::OrHash)).void
      end
      attr_writer :email

      sig { returns(T.nilable(Trycourier::BrandSettingsInApp)) }
      attr_reader :inapp

      sig do
        params(inapp: T.nilable(Trycourier::BrandSettingsInApp::OrHash)).void
      end
      attr_writer :inapp

      sig do
        params(
          colors: T.nilable(Trycourier::BrandColors::OrHash),
          email: T.nilable(Trycourier::BrandSettingsEmail::OrHash),
          inapp: T.nilable(Trycourier::BrandSettingsInApp::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(colors: nil, email: nil, inapp: nil)
      end

      sig do
        override.returns(
          {
            colors: T.nilable(Trycourier::BrandColors),
            email: T.nilable(Trycourier::BrandSettingsEmail),
            inapp: T.nilable(Trycourier::BrandSettingsInApp)
          }
        )
      end
      def to_hash
      end
    end
  end
end

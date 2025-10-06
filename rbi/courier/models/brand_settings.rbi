# typed: strong

module Courier
  module Models
    class BrandSettings < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BrandSettings, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(Courier::BrandColors)) }
      attr_reader :colors

      sig { params(colors: T.nilable(Courier::BrandColors::OrHash)).void }
      attr_writer :colors

      sig { returns(T.nilable(Courier::BrandSettingsEmail)) }
      attr_reader :email

      sig { params(email: T.nilable(Courier::BrandSettingsEmail::OrHash)).void }
      attr_writer :email

      sig { returns(T.nilable(Courier::BrandSettingsInApp)) }
      attr_reader :inapp

      sig { params(inapp: T.nilable(Courier::BrandSettingsInApp::OrHash)).void }
      attr_writer :inapp

      sig do
        params(
          colors: T.nilable(Courier::BrandColors::OrHash),
          email: T.nilable(Courier::BrandSettingsEmail::OrHash),
          inapp: T.nilable(Courier::BrandSettingsInApp::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(colors: nil, email: nil, inapp: nil)
      end

      sig do
        override.returns(
          {
            colors: T.nilable(Courier::BrandColors),
            email: T.nilable(Courier::BrandSettingsEmail),
            inapp: T.nilable(Courier::BrandSettingsInApp)
          }
        )
      end
      def to_hash
      end
    end
  end
end

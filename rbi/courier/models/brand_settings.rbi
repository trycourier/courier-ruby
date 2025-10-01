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

      sig { returns(T.nilable(T.anything)) }
      attr_reader :inapp

      sig { params(inapp: T.anything).void }
      attr_writer :inapp

      sig do
        params(
          colors: T.nilable(Courier::BrandSettings::Colors::OrHash),
          email: T.nilable(Courier::BrandSettings::Email::OrHash),
          inapp: T.anything
        ).returns(T.attached_class)
      end
      def self.new(colors: nil, email: nil, inapp: nil)
      end

      sig do
        override.returns(
          {
            colors: T.nilable(Courier::BrandSettings::Colors),
            email: T.nilable(Courier::BrandSettings::Email),
            inapp: T.anything
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

        sig { returns(T.nilable(String)) }
        attr_accessor :tertiary

        sig do
          params(
            primary: T.nilable(String),
            secondary: T.nilable(String),
            tertiary: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(primary: nil, secondary: nil, tertiary: nil)
        end

        sig do
          override.returns(
            {
              primary: T.nilable(String),
              secondary: T.nilable(String),
              tertiary: T.nilable(String)
            }
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

        sig { returns(T.anything) }
        attr_accessor :footer

        sig { returns(T.anything) }
        attr_accessor :header

        sig do
          params(footer: T.anything, header: T.anything).returns(
            T.attached_class
          )
        end
        def self.new(footer:, header:)
        end

        sig { override.returns({ footer: T.anything, header: T.anything }) }
        def to_hash
        end
      end
    end
  end
end

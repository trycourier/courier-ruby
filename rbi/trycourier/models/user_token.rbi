# typed: strong

module Trycourier
  module Models
    class UserToken < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::UserToken, Trycourier::Internal::AnyHash)
        end

      sig { returns(Trycourier::UserToken::ProviderKey::TaggedSymbol) }
      attr_accessor :provider_key

      # Full body of the token. Must match token in URL.
      sig { returns(T.nilable(String)) }
      attr_accessor :token

      # Information about the device the token is associated with.
      sig { returns(T.nilable(Trycourier::UserToken::Device)) }
      attr_reader :device

      sig do
        params(device: T.nilable(Trycourier::UserToken::Device::OrHash)).void
      end
      attr_writer :device

      # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
      # disable expiration.
      sig { returns(T.nilable(Trycourier::UserToken::ExpiryDate::Variants)) }
      attr_accessor :expiry_date

      # Properties sent to the provider along with the token
      sig { returns(T.nilable(T.anything)) }
      attr_reader :properties

      sig { params(properties: T.anything).void }
      attr_writer :properties

      # Information about the device the token is associated with.
      sig { returns(T.nilable(Trycourier::UserToken::Tracking)) }
      attr_reader :tracking

      sig do
        params(
          tracking: T.nilable(Trycourier::UserToken::Tracking::OrHash)
        ).void
      end
      attr_writer :tracking

      sig do
        params(
          provider_key: Trycourier::UserToken::ProviderKey::OrSymbol,
          token: T.nilable(String),
          device: T.nilable(Trycourier::UserToken::Device::OrHash),
          expiry_date: T.nilable(Trycourier::UserToken::ExpiryDate::Variants),
          properties: T.anything,
          tracking: T.nilable(Trycourier::UserToken::Tracking::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        provider_key:,
        # Full body of the token. Must match token in URL.
        token: nil,
        # Information about the device the token is associated with.
        device: nil,
        # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        # disable expiration.
        expiry_date: nil,
        # Properties sent to the provider along with the token
        properties: nil,
        # Information about the device the token is associated with.
        tracking: nil
      )
      end

      sig do
        override.returns(
          {
            provider_key: Trycourier::UserToken::ProviderKey::TaggedSymbol,
            token: T.nilable(String),
            device: T.nilable(Trycourier::UserToken::Device),
            expiry_date: T.nilable(Trycourier::UserToken::ExpiryDate::Variants),
            properties: T.anything,
            tracking: T.nilable(Trycourier::UserToken::Tracking)
          }
        )
      end
      def to_hash
      end

      module ProviderKey
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::UserToken::ProviderKey) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FIREBASE_FCM =
          T.let(
            :"firebase-fcm",
            Trycourier::UserToken::ProviderKey::TaggedSymbol
          )
        APN = T.let(:apn, Trycourier::UserToken::ProviderKey::TaggedSymbol)
        EXPO = T.let(:expo, Trycourier::UserToken::ProviderKey::TaggedSymbol)
        ONESIGNAL =
          T.let(:onesignal, Trycourier::UserToken::ProviderKey::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::UserToken::ProviderKey::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Device < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Trycourier::UserToken::Device, Trycourier::Internal::AnyHash)
          end

        # Id of the advertising identifier
        sig { returns(T.nilable(String)) }
        attr_accessor :ad_id

        # Id of the application the token is used for
        sig { returns(T.nilable(String)) }
        attr_accessor :app_id

        # Id of the device the token is associated with
        sig { returns(T.nilable(String)) }
        attr_accessor :device_id

        # The device manufacturer
        sig { returns(T.nilable(String)) }
        attr_accessor :manufacturer

        # The device model
        sig { returns(T.nilable(String)) }
        attr_accessor :model

        # The device platform i.e. android, ios, web
        sig { returns(T.nilable(String)) }
        attr_accessor :platform

        # Information about the device the token is associated with.
        sig do
          params(
            ad_id: T.nilable(String),
            app_id: T.nilable(String),
            device_id: T.nilable(String),
            manufacturer: T.nilable(String),
            model: T.nilable(String),
            platform: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Id of the advertising identifier
          ad_id: nil,
          # Id of the application the token is used for
          app_id: nil,
          # Id of the device the token is associated with
          device_id: nil,
          # The device manufacturer
          manufacturer: nil,
          # The device model
          model: nil,
          # The device platform i.e. android, ios, web
          platform: nil
        )
        end

        sig do
          override.returns(
            {
              ad_id: T.nilable(String),
              app_id: T.nilable(String),
              device_id: T.nilable(String),
              manufacturer: T.nilable(String),
              model: T.nilable(String),
              platform: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
      # disable expiration.
      module ExpiryDate
        extend Trycourier::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Boolean) }

        sig do
          override.returns(
            T::Array[Trycourier::UserToken::ExpiryDate::Variants]
          )
        end
        def self.variants
        end
      end

      class Tracking < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::UserToken::Tracking,
              Trycourier::Internal::AnyHash
            )
          end

        # The IP address of the device
        sig { returns(T.nilable(String)) }
        attr_accessor :ip

        # The latitude of the device
        sig { returns(T.nilable(String)) }
        attr_accessor :lat

        # The longitude of the device
        sig { returns(T.nilable(String)) }
        attr_accessor :long

        # The operating system version
        sig { returns(T.nilable(String)) }
        attr_accessor :os_version

        # Information about the device the token is associated with.
        sig do
          params(
            ip: T.nilable(String),
            lat: T.nilable(String),
            long: T.nilable(String),
            os_version: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The IP address of the device
          ip: nil,
          # The latitude of the device
          lat: nil,
          # The longitude of the device
          long: nil,
          # The operating system version
          os_version: nil
        )
        end

        sig do
          override.returns(
            {
              ip: T.nilable(String),
              lat: T.nilable(String),
              long: T.nilable(String),
              os_version: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

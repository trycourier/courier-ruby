# typed: strong

module Courier
  module Models
    class UserToken < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::UserToken, Courier::Internal::AnyHash) }

      sig { returns(Courier::UserToken::ProviderKey::TaggedSymbol) }
      attr_accessor :provider_key

      # Full body of the token. Must match token in URL.
      sig { returns(T.nilable(String)) }
      attr_accessor :token

      # Information about the device the token is associated with.
      sig { returns(T.nilable(Courier::UserToken::Device)) }
      attr_reader :device

      sig { params(device: T.nilable(Courier::UserToken::Device::OrHash)).void }
      attr_writer :device

      # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
      # disable expiration.
      sig { returns(T.nilable(Courier::UserToken::ExpiryDate::Variants)) }
      attr_accessor :expiry_date

      # Properties sent to the provider along with the token
      sig { returns(T.nilable(T.anything)) }
      attr_reader :properties

      sig { params(properties: T.anything).void }
      attr_writer :properties

      # Information about the device the token is associated with.
      sig { returns(T.nilable(Courier::UserToken::Tracking)) }
      attr_reader :tracking

      sig do
        params(tracking: T.nilable(Courier::UserToken::Tracking::OrHash)).void
      end
      attr_writer :tracking

      sig do
        params(
          provider_key: Courier::UserToken::ProviderKey::OrSymbol,
          token: T.nilable(String),
          device: T.nilable(Courier::UserToken::Device::OrHash),
          expiry_date: T.nilable(Courier::UserToken::ExpiryDate::Variants),
          properties: T.anything,
          tracking: T.nilable(Courier::UserToken::Tracking::OrHash)
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
            provider_key: Courier::UserToken::ProviderKey::TaggedSymbol,
            token: T.nilable(String),
            device: T.nilable(Courier::UserToken::Device),
            expiry_date: T.nilable(Courier::UserToken::ExpiryDate::Variants),
            properties: T.anything,
            tracking: T.nilable(Courier::UserToken::Tracking)
          }
        )
      end
      def to_hash
      end

      module ProviderKey
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::UserToken::ProviderKey) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FIREBASE_FCM =
          T.let(:"firebase-fcm", Courier::UserToken::ProviderKey::TaggedSymbol)
        APN = T.let(:apn, Courier::UserToken::ProviderKey::TaggedSymbol)
        EXPO = T.let(:expo, Courier::UserToken::ProviderKey::TaggedSymbol)
        ONESIGNAL =
          T.let(:onesignal, Courier::UserToken::ProviderKey::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::UserToken::ProviderKey::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Device < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::UserToken::Device, Courier::Internal::AnyHash)
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
        extend Courier::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Boolean) }

        sig do
          override.returns(T::Array[Courier::UserToken::ExpiryDate::Variants])
        end
        def self.variants
        end
      end

      class Tracking < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Courier::UserToken::Tracking, Courier::Internal::AnyHash)
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

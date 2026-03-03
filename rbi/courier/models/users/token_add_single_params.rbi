# typed: strong

module Courier
  module Models
    module Users
      class TokenAddSingleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::TokenAddSingleParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig do
          returns(Courier::Users::TokenAddSingleParams::ProviderKey::OrSymbol)
        end
        attr_accessor :provider_key

        # Information about the device the token came from.
        sig { returns(T.nilable(Courier::Users::TokenAddSingleParams::Device)) }
        attr_reader :device

        sig do
          params(
            device:
              T.nilable(Courier::Users::TokenAddSingleParams::Device::OrHash)
          ).void
        end
        attr_writer :device

        # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        # disable expiration.
        sig do
          returns(
            T.nilable(
              Courier::Users::TokenAddSingleParams::ExpiryDate::Variants
            )
          )
        end
        attr_accessor :expiry_date

        # Properties about the token.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :properties

        sig { params(properties: T.anything).void }
        attr_writer :properties

        # Tracking information about the device the token came from.
        sig do
          returns(T.nilable(Courier::Users::TokenAddSingleParams::Tracking))
        end
        attr_reader :tracking

        sig do
          params(
            tracking:
              T.nilable(Courier::Users::TokenAddSingleParams::Tracking::OrHash)
          ).void
        end
        attr_writer :tracking

        sig do
          params(
            user_id: String,
            provider_key:
              Courier::Users::TokenAddSingleParams::ProviderKey::OrSymbol,
            device:
              T.nilable(Courier::Users::TokenAddSingleParams::Device::OrHash),
            expiry_date:
              T.nilable(
                Courier::Users::TokenAddSingleParams::ExpiryDate::Variants
              ),
            properties: T.anything,
            tracking:
              T.nilable(Courier::Users::TokenAddSingleParams::Tracking::OrHash),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          provider_key:,
          # Information about the device the token came from.
          device: nil,
          # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
          # disable expiration.
          expiry_date: nil,
          # Properties about the token.
          properties: nil,
          # Tracking information about the device the token came from.
          tracking: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              provider_key:
                Courier::Users::TokenAddSingleParams::ProviderKey::OrSymbol,
              device: T.nilable(Courier::Users::TokenAddSingleParams::Device),
              expiry_date:
                T.nilable(
                  Courier::Users::TokenAddSingleParams::ExpiryDate::Variants
                ),
              properties: T.anything,
              tracking:
                T.nilable(Courier::Users::TokenAddSingleParams::Tracking),
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end

        module ProviderKey
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Users::TokenAddSingleParams::ProviderKey)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FIREBASE_FCM =
            T.let(
              :"firebase-fcm",
              Courier::Users::TokenAddSingleParams::ProviderKey::TaggedSymbol
            )
          APN =
            T.let(
              :apn,
              Courier::Users::TokenAddSingleParams::ProviderKey::TaggedSymbol
            )
          EXPO =
            T.let(
              :expo,
              Courier::Users::TokenAddSingleParams::ProviderKey::TaggedSymbol
            )
          ONESIGNAL =
            T.let(
              :onesignal,
              Courier::Users::TokenAddSingleParams::ProviderKey::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Users::TokenAddSingleParams::ProviderKey::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Device < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Users::TokenAddSingleParams::Device,
                Courier::Internal::AnyHash
              )
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

          # Information about the device the token came from.
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
            override.returns(
              T::Array[
                Courier::Users::TokenAddSingleParams::ExpiryDate::Variants
              ]
            )
          end
          def self.variants
          end
        end

        class Tracking < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Users::TokenAddSingleParams::Tracking,
                Courier::Internal::AnyHash
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

          # Tracking information about the device the token came from.
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
end

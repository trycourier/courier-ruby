# frozen_string_literal: true

module Trycourier
  module Models
    module Users
      class UserToken < Trycourier::Internal::Type::BaseModel
        # @!attribute provider_key
        #
        #   @return [Symbol, Trycourier::Models::Users::UserToken::ProviderKey]
        required :provider_key, enum: -> { Trycourier::Users::UserToken::ProviderKey }

        # @!attribute token
        #   Full body of the token. Must match token in URL.
        #
        #   @return [String, nil]
        optional :token, String, nil?: true

        # @!attribute device
        #   Information about the device the token is associated with.
        #
        #   @return [Trycourier::Models::Users::UserToken::Device, nil]
        optional :device, -> { Trycourier::Users::UserToken::Device }, nil?: true

        # @!attribute expiry_date
        #   ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        #   disable expiration.
        #
        #   @return [String, Boolean, nil]
        optional :expiry_date, union: -> { Trycourier::Users::UserToken::ExpiryDate }, nil?: true

        # @!attribute properties
        #   Properties sent to the provider along with the token
        #
        #   @return [Object, nil]
        optional :properties, Trycourier::Internal::Type::Unknown

        # @!attribute tracking
        #   Information about the device the token is associated with.
        #
        #   @return [Trycourier::Models::Users::UserToken::Tracking, nil]
        optional :tracking, -> { Trycourier::Users::UserToken::Tracking }, nil?: true

        # @!method initialize(provider_key:, token: nil, device: nil, expiry_date: nil, properties: nil, tracking: nil)
        #   Some parameter documentations has been truncated, see
        #   {Trycourier::Models::Users::UserToken} for more details.
        #
        #   @param provider_key [Symbol, Trycourier::Models::Users::UserToken::ProviderKey]
        #
        #   @param token [String, nil] Full body of the token. Must match token in URL.
        #
        #   @param device [Trycourier::Models::Users::UserToken::Device, nil] Information about the device the token is associated with.
        #
        #   @param expiry_date [String, Boolean, nil] ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        #
        #   @param properties [Object] Properties sent to the provider along with the token
        #
        #   @param tracking [Trycourier::Models::Users::UserToken::Tracking, nil] Information about the device the token is associated with.

        # @see Trycourier::Models::Users::UserToken#provider_key
        module ProviderKey
          extend Trycourier::Internal::Type::Enum

          FIREBASE_FCM = :"firebase-fcm"
          APN = :apn
          EXPO = :expo
          ONESIGNAL = :onesignal

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Trycourier::Models::Users::UserToken#device
        class Device < Trycourier::Internal::Type::BaseModel
          # @!attribute ad_id
          #   Id of the advertising identifier
          #
          #   @return [String, nil]
          optional :ad_id, String, nil?: true

          # @!attribute app_id
          #   Id of the application the token is used for
          #
          #   @return [String, nil]
          optional :app_id, String, nil?: true

          # @!attribute device_id
          #   Id of the device the token is associated with
          #
          #   @return [String, nil]
          optional :device_id, String, nil?: true

          # @!attribute manufacturer
          #   The device manufacturer
          #
          #   @return [String, nil]
          optional :manufacturer, String, nil?: true

          # @!attribute model
          #   The device model
          #
          #   @return [String, nil]
          optional :model, String, nil?: true

          # @!attribute platform
          #   The device platform i.e. android, ios, web
          #
          #   @return [String, nil]
          optional :platform, String, nil?: true

          # @!method initialize(ad_id: nil, app_id: nil, device_id: nil, manufacturer: nil, model: nil, platform: nil)
          #   Information about the device the token is associated with.
          #
          #   @param ad_id [String, nil] Id of the advertising identifier
          #
          #   @param app_id [String, nil] Id of the application the token is used for
          #
          #   @param device_id [String, nil] Id of the device the token is associated with
          #
          #   @param manufacturer [String, nil] The device manufacturer
          #
          #   @param model [String, nil] The device model
          #
          #   @param platform [String, nil] The device platform i.e. android, ios, web
        end

        # ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        # disable expiration.
        #
        # @see Trycourier::Models::Users::UserToken#expiry_date
        module ExpiryDate
          extend Trycourier::Internal::Type::Union

          variant String

          variant Trycourier::Internal::Type::Boolean

          # @!method self.variants
          #   @return [Array(String, Boolean)]
        end

        # @see Trycourier::Models::Users::UserToken#tracking
        class Tracking < Trycourier::Internal::Type::BaseModel
          # @!attribute ip
          #   The IP address of the device
          #
          #   @return [String, nil]
          optional :ip, String, nil?: true

          # @!attribute lat
          #   The latitude of the device
          #
          #   @return [String, nil]
          optional :lat, String, nil?: true

          # @!attribute long
          #   The longitude of the device
          #
          #   @return [String, nil]
          optional :long, String, nil?: true

          # @!attribute os_version
          #   The operating system version
          #
          #   @return [String, nil]
          optional :os_version, String, nil?: true

          # @!method initialize(ip: nil, lat: nil, long: nil, os_version: nil)
          #   Information about the device the token is associated with.
          #
          #   @param ip [String, nil] The IP address of the device
          #
          #   @param lat [String, nil] The latitude of the device
          #
          #   @param long [String, nil] The longitude of the device
          #
          #   @param os_version [String, nil] The operating system version
        end
      end
    end

    UserToken = Users::UserToken
  end
end

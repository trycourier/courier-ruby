# frozen_string_literal: true

module Courier
  module Models
    module Users
      # @see Courier::Resources::Users::Tokens#add_single
      class TokenAddSingleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute user_id
        #
        #   @return [String]
        required :user_id, String

        # @!attribute token
        #
        #   @return [String]
        required :token, String

        # @!attribute provider_key
        #
        #   @return [Symbol, Courier::Models::Users::TokenAddSingleParams::ProviderKey]
        required :provider_key, enum: -> { Courier::Users::TokenAddSingleParams::ProviderKey }

        # @!attribute device
        #   Information about the device the token came from.
        #
        #   @return [Courier::Models::Users::TokenAddSingleParams::Device, nil]
        optional :device, -> { Courier::Users::TokenAddSingleParams::Device }, nil?: true

        # @!attribute expiry_date
        #   ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        #   disable expiration.
        #
        #   @return [String, Boolean, nil]
        optional :expiry_date, union: -> { Courier::Users::TokenAddSingleParams::ExpiryDate }, nil?: true

        # @!attribute properties
        #   Properties about the token.
        #
        #   @return [Object, nil]
        optional :properties, Courier::Internal::Type::Unknown

        # @!attribute tracking
        #   Tracking information about the device the token came from.
        #
        #   @return [Courier::Models::Users::TokenAddSingleParams::Tracking, nil]
        optional :tracking, -> { Courier::Users::TokenAddSingleParams::Tracking }, nil?: true

        # @!method initialize(user_id:, token:, provider_key:, device: nil, expiry_date: nil, properties: nil, tracking: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Users::TokenAddSingleParams} for more details.
        #
        #   @param user_id [String]
        #
        #   @param token [String]
        #
        #   @param provider_key [Symbol, Courier::Models::Users::TokenAddSingleParams::ProviderKey]
        #
        #   @param device [Courier::Models::Users::TokenAddSingleParams::Device, nil] Information about the device the token came from.
        #
        #   @param expiry_date [String, Boolean, nil] ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to
        #
        #   @param properties [Object] Properties about the token.
        #
        #   @param tracking [Courier::Models::Users::TokenAddSingleParams::Tracking, nil] Tracking information about the device the token came from.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

        module ProviderKey
          extend Courier::Internal::Type::Enum

          FIREBASE_FCM = :"firebase-fcm"
          APN = :apn
          EXPO = :expo
          ONESIGNAL = :onesignal

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Device < Courier::Internal::Type::BaseModel
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
          #   Information about the device the token came from.
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
        module ExpiryDate
          extend Courier::Internal::Type::Union

          variant String

          variant Courier::Internal::Type::Boolean

          # @!method self.variants
          #   @return [Array(String, Boolean)]
        end

        class Tracking < Courier::Internal::Type::BaseModel
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
          #   Tracking information about the device the token came from.
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
  end
end

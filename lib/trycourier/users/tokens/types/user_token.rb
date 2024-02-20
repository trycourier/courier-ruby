# frozen_string_literal: true

require_relative "provider_key"
require_relative "expiry_date"
require_relative "device"
require_relative "tracking"
require "json"

module Courier
  module Users
    class Tokens
      class UserToken
        attr_reader :token, :provider_key, :expiry_date, :properties, :device, :tracking, :additional_properties

        # @param token [String] Full body of the token. Must match token in URL.
        # @param provider_key [PROVIDER_KEY]
        # @param expiry_date [Users::Tokens::ExpiryDate] ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to disable expiration.
        # @param properties [Object] Properties sent to the provider along with the token
        # @param device [Users::Tokens::Device] Information about the device the token is associated with.
        # @param tracking [Users::Tokens::Tracking] Information about the device the token is associated with.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::UserToken]
        def initialize(provider_key:, token: nil, expiry_date: nil, properties: nil, device: nil, tracking: nil,
                       additional_properties: nil)
          # @type [String] Full body of the token. Must match token in URL.
          @token = token
          # @type [PROVIDER_KEY]
          @provider_key = provider_key
          # @type [Users::Tokens::ExpiryDate] ISO 8601 formatted date the token expires. Defaults to 2 months. Set to false to disable expiration.
          @expiry_date = expiry_date
          # @type [Object] Properties sent to the provider along with the token
          @properties = properties
          # @type [Users::Tokens::Device] Information about the device the token is associated with.
          @device = device
          # @type [Users::Tokens::Tracking] Information about the device the token is associated with.
          @tracking = tracking
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of UserToken
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::UserToken]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          token = struct.token
          provider_key = Users::Tokens::PROVIDER_KEY.key(parsed_json["provider_key"]) || parsed_json["provider_key"]
          if parsed_json["expiry_date"].nil?
            expiry_date = nil
          else
            expiry_date = parsed_json["expiry_date"].to_json
            expiry_date = Users::Tokens::ExpiryDate.from_json(json_object: expiry_date)
          end
          properties = struct.properties
          if parsed_json["device"].nil?
            device = nil
          else
            device = parsed_json["device"].to_json
            device = Users::Tokens::Device.from_json(json_object: device)
          end
          if parsed_json["tracking"].nil?
            tracking = nil
          else
            tracking = parsed_json["tracking"].to_json
            tracking = Users::Tokens::Tracking.from_json(json_object: tracking)
          end
          new(token: token, provider_key: provider_key, expiry_date: expiry_date, properties: properties,
              device: device, tracking: tracking, additional_properties: struct)
        end

        # Serialize an instance of UserToken to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "token": @token,
            "provider_key": Users::Tokens::PROVIDER_KEY[@provider_key] || @provider_key,
            "expiry_date": @expiry_date,
            "properties": @properties,
            "device": @device,
            "tracking": @tracking
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.token&.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
          obj.provider_key.is_a?(Users::Tokens::PROVIDER_KEY) != false || raise("Passed value for field obj.provider_key is not the expected type, validation failed.")
          obj.expiry_date.nil? || Users::Tokens::ExpiryDate.validate_raw(obj: obj.expiry_date)
          obj.properties&.is_a?(Object) != false || raise("Passed value for field obj.properties is not the expected type, validation failed.")
          obj.device.nil? || Users::Tokens::Device.validate_raw(obj: obj.device)
          obj.tracking.nil? || Users::Tokens::Tracking.validate_raw(obj: obj.tracking)
        end
      end
    end
  end
end

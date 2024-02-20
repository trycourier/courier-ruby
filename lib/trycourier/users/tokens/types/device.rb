# frozen_string_literal: true

require "json"

module Courier
  module Users
    class Tokens
      class Device
        attr_reader :app_id, :ad_id, :device_id, :platform, :manufacturer, :model, :additional_properties

        # @param app_id [String] Id of the application the token is used for
        # @param ad_id [String] Id of the advertising identifier
        # @param device_id [String] Id of the device the token is associated with
        # @param platform [String] The device platform i.e. android, ios, web
        # @param manufacturer [String] The device manufacturer
        # @param model [String] The device model
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::Device]
        def initialize(app_id: nil, ad_id: nil, device_id: nil, platform: nil, manufacturer: nil, model: nil,
                       additional_properties: nil)
          # @type [String] Id of the application the token is used for
          @app_id = app_id
          # @type [String] Id of the advertising identifier
          @ad_id = ad_id
          # @type [String] Id of the device the token is associated with
          @device_id = device_id
          # @type [String] The device platform i.e. android, ios, web
          @platform = platform
          # @type [String] The device manufacturer
          @manufacturer = manufacturer
          # @type [String] The device model
          @model = model
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Device
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::Device]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          app_id = struct.app_id
          ad_id = struct.ad_id
          device_id = struct.device_id
          platform = struct.platform
          manufacturer = struct.manufacturer
          model = struct.model
          new(app_id: app_id, ad_id: ad_id, device_id: device_id, platform: platform, manufacturer: manufacturer,
              model: model, additional_properties: struct)
        end

        # Serialize an instance of Device to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "app_id": @app_id,
            "ad_id": @ad_id,
            "device_id": @device_id,
            "platform": @platform,
            "manufacturer": @manufacturer,
            "model": @model
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.app_id&.is_a?(String) != false || raise("Passed value for field obj.app_id is not the expected type, validation failed.")
          obj.ad_id&.is_a?(String) != false || raise("Passed value for field obj.ad_id is not the expected type, validation failed.")
          obj.device_id&.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
          obj.platform&.is_a?(String) != false || raise("Passed value for field obj.platform is not the expected type, validation failed.")
          obj.manufacturer&.is_a?(String) != false || raise("Passed value for field obj.manufacturer is not the expected type, validation failed.")
          obj.model&.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
        end
      end
    end
  end
end

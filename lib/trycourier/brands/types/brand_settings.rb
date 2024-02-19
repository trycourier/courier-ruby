# frozen_string_literal: true

require_relative "brand_colors"
require_relative "../../commons/types/email"
require "json"

module Courier
  class Brands
    class BrandSettings
      attr_reader :colors, :inapp, :email, :additional_properties

      # @param colors [Brands::BrandColors]
      # @param inapp [Object]
      # @param email [Commons::Email]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandSettings]
      def initialize(colors: nil, inapp: nil, email: nil, additional_properties: nil)
        # @type [Brands::BrandColors]
        @colors = colors
        # @type [Object]
        @inapp = inapp
        # @type [Commons::Email]
        @email = email
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSettings
      #
      # @param json_object [JSON]
      # @return [Brands::BrandSettings]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["colors"].nil?
          colors = nil
        else
          colors = parsed_json["colors"].to_json
          colors = Brands::BrandColors.from_json(json_object: colors)
        end
        inapp = struct.inapp
        if parsed_json["email"].nil?
          email = nil
        else
          email = parsed_json["email"].to_json
          email = Commons::Email.from_json(json_object: email)
        end
        new(colors: colors, inapp: inapp, email: email, additional_properties: struct)
      end

      # Serialize an instance of BrandSettings to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "colors": @colors, "inapp": @inapp, "email": @email }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.colors.nil? || Brands::BrandColors.validate_raw(obj: obj.colors)
        obj.inapp&.is_a?(Object) != false || raise("Passed value for field obj.inapp is not the expected type, validation failed.")
        obj.email.nil? || Commons::Email.validate_raw(obj: obj.email)
      end
    end
  end
end

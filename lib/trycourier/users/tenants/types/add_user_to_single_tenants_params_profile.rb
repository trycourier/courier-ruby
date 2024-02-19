# frozen_string_literal: true

require "json"

module Courier
  module Users
    class Tenants
      class AddUserToSingleTenantsParamsProfile
        attr_reader :title, :email, :phone_number, :locale, :additional_fields, :additional_properties

        # @param title [String]
        # @param email [String] Email Address
        # @param phone_number [String] A valid phone number
        # @param locale [String] The user's preferred ISO 639-1 language code.
        # @param additional_fields [Hash{String => String}] Additional provider specific fields may be specified.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tenants::AddUserToSingleTenantsParamsProfile]
        def initialize(title:, email:, phone_number:, locale:, additional_fields:, additional_properties: nil)
          # @type [String]
          @title = title
          # @type [String] Email Address
          @email = email
          # @type [String] A valid phone number
          @phone_number = phone_number
          # @type [String] The user's preferred ISO 639-1 language code.
          @locale = locale
          # @type [Hash{String => String}] Additional provider specific fields may be specified.
          @additional_fields = additional_fields
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of AddUserToSingleTenantsParamsProfile
        #
        # @param json_object [JSON]
        # @return [Users::Tenants::AddUserToSingleTenantsParamsProfile]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          title = struct.title
          email = struct.email
          phone_number = struct.phone_number
          locale = struct.locale
          additional_fields = struct.additional_fields
          new(title: title, email: email, phone_number: phone_number, locale: locale,
              additional_fields: additional_fields, additional_properties: struct)
        end

        # Serialize an instance of AddUserToSingleTenantsParamsProfile to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "title": @title,
            "email": @email,
            "phone_number": @phone_number,
            "locale": @locale,
            "additional_fields": @additional_fields
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
          obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
          obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
          obj.locale.is_a?(String) != false || raise("Passed value for field obj.locale is not the expected type, validation failed.")
          obj.additional_fields.is_a?(Hash) != false || raise("Passed value for field obj.additional_fields is not the expected type, validation failed.")
        end
      end
    end
  end
end

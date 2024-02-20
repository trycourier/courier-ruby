# frozen_string_literal: true

require_relative "message_context"
require_relative "message_data"
require_relative "i_profile_preferences"
require "json"

module Courier
  class Send
    class UserRecipient
      attr_reader :account_id, :context, :data, :email, :locale, :user_id, :phone_number, :preferences, :tenant_id,
                  :additional_properties

      # @param account_id [String] Use `tenant_id` instad.
      # @param context [Send::MessageContext] Context information such as tenant_id to send the notification with.
      # @param data [Send::MESSAGE_DATA]
      # @param email [String]
      # @param locale [String] The user's preferred ISO 639-1 language code.
      # @param user_id [String]
      # @param phone_number [String]
      # @param preferences [Send::IProfilePreferences]
      # @param tenant_id [String] An id of a tenant, [see tenants api docs](https://www.courier.com/docs/reference/tenants).
      #   Will load brand, default preferences and any other base context data associated with this tenant.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::UserRecipient]
      def initialize(account_id: nil, context: nil, data: nil, email: nil, locale: nil, user_id: nil,
                     phone_number: nil, preferences: nil, tenant_id: nil, additional_properties: nil)
        # @type [String] Use `tenant_id` instad.
        @account_id = account_id
        # @type [Send::MessageContext] Context information such as tenant_id to send the notification with.
        @context = context
        # @type [Send::MESSAGE_DATA]
        @data = data
        # @type [String]
        @email = email
        # @type [String] The user's preferred ISO 639-1 language code.
        @locale = locale
        # @type [String]
        @user_id = user_id
        # @type [String]
        @phone_number = phone_number
        # @type [Send::IProfilePreferences]
        @preferences = preferences
        # @type [String] An id of a tenant, [see tenants api docs](https://www.courier.com/docs/reference/tenants).
        #   Will load brand, default preferences and any other base context data associated with this tenant.
        @tenant_id = tenant_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of UserRecipient
      #
      # @param json_object [JSON]
      # @return [Send::UserRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        account_id = struct.account_id
        if parsed_json["context"].nil?
          context = nil
        else
          context = parsed_json["context"].to_json
          context = Send::MessageContext.from_json(json_object: context)
        end
        data = struct.data
        email = struct.email
        locale = struct.locale
        user_id = struct.user_id
        phone_number = struct.phone_number
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Send::IProfilePreferences.from_json(json_object: preferences)
        end
        tenant_id = struct.tenant_id
        new(account_id: account_id, context: context, data: data, email: email, locale: locale, user_id: user_id,
            phone_number: phone_number, preferences: preferences, tenant_id: tenant_id, additional_properties: struct)
      end

      # Serialize an instance of UserRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "account_id": @account_id,
          "context": @context,
          "data": @data,
          "email": @email,
          "locale": @locale,
          "user_id": @user_id,
          "phone_number": @phone_number,
          "preferences": @preferences,
          "tenant_id": @tenant_id
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.account_id&.is_a?(String) != false || raise("Passed value for field obj.account_id is not the expected type, validation failed.")
        obj.context.nil? || Send::MessageContext.validate_raw(obj: obj.context)
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.locale&.is_a?(String) != false || raise("Passed value for field obj.locale is not the expected type, validation failed.")
        obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.preferences.nil? || Send::IProfilePreferences.validate_raw(obj: obj.preferences)
        obj.tenant_id&.is_a?(String) != false || raise("Passed value for field obj.tenant_id is not the expected type, validation failed.")
      end
    end
  end
end

# frozen_string_literal: true

require "json"

module Courier
  class SendMessageResponse
    attr_reader :request_id, :additional_properties

    # @param request_id [String] A successful call to `POST /send` returns a `202` status code along with a `requestId` in the response body.
    #   For send requests that have a single recipient, the `requestId` is assigned to the derived message as its message_id. Therefore the `requestId` can be supplied to the Message's API for single recipient messages.
    #   For send requests that have multiple recipients (accounts, audiences, lists, etc.), Courier assigns a unique id to each derived message as its `message_id`. Therefore the `requestId` cannot be supplied to the Message's API for single-recipient messages.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SendMessageResponse]
    def initialize(request_id:, additional_properties: nil)
      # @type [String] A successful call to `POST /send` returns a `202` status code along with a `requestId` in the response body.
      #   For send requests that have a single recipient, the `requestId` is assigned to the derived message as its message_id. Therefore the `requestId` can be supplied to the Message's API for single recipient messages.
      #   For send requests that have multiple recipients (accounts, audiences, lists, etc.), Courier assigns a unique id to each derived message as its `message_id`. Therefore the `requestId` cannot be supplied to the Message's API for single-recipient messages.
      @request_id = request_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SendMessageResponse
    #
    # @param json_object [JSON]
    # @return [SendMessageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      request_id = struct.requestId
      new(request_id: request_id, additional_properties: struct)
    end

    # Serialize an instance of SendMessageResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "requestId": @request_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.request_id.is_a?(String) != false || raise("Passed value for field obj.request_id is not the expected type, validation failed.")
    end
  end
end

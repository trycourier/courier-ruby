# frozen_string_literal: true

require_relative "attachment"
require_relative "../../brands/types/brand"
require_relative "tracking_override"
require "json"

module Courier
  class Send
    class MessageChannelEmailOverride
      attr_reader :attachments, :bcc, :brand, :cc, :from, :html, :reply_to, :subject, :text, :tracking,
                  :additional_properties

      # @param attachments [Array<Send::ATTACHMENT>]
      # @param bcc [String]
      # @param brand [Brands::Brand]
      # @param cc [String]
      # @param from [String]
      # @param html [String]
      # @param reply_to [String]
      # @param subject [String]
      # @param text [String]
      # @param tracking [Send::TrackingOverride]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MessageChannelEmailOverride]
      def initialize(tracking:, attachments: nil, bcc: nil, brand: nil, cc: nil, from: nil, html: nil, reply_to: nil,
                     subject: nil, text: nil, additional_properties: nil)
        # @type [Array<Send::ATTACHMENT>]
        @attachments = attachments
        # @type [String]
        @bcc = bcc
        # @type [Brands::Brand]
        @brand = brand
        # @type [String]
        @cc = cc
        # @type [String]
        @from = from
        # @type [String]
        @html = html
        # @type [String]
        @reply_to = reply_to
        # @type [String]
        @subject = subject
        # @type [String]
        @text = text
        # @type [Send::TrackingOverride]
        @tracking = tracking
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageChannelEmailOverride
      #
      # @param json_object [JSON]
      # @return [Send::MessageChannelEmailOverride]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        attachments = struct.attachments
        bcc = struct.bcc
        if parsed_json["brand"].nil?
          brand = nil
        else
          brand = parsed_json["brand"].to_json
          brand = Brands::Brand.from_json(json_object: brand)
        end
        cc = struct.cc
        from = struct.from
        html = struct.html
        reply_to = struct.reply_to
        subject = struct.subject
        text = struct.text
        if parsed_json["tracking"].nil?
          tracking = nil
        else
          tracking = parsed_json["tracking"].to_json
          tracking = Send::TrackingOverride.from_json(json_object: tracking)
        end
        new(attachments: attachments, bcc: bcc, brand: brand, cc: cc, from: from, html: html, reply_to: reply_to,
            subject: subject, text: text, tracking: tracking, additional_properties: struct)
      end

      # Serialize an instance of MessageChannelEmailOverride to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "attachments": @attachments,
          "bcc": @bcc,
          "brand": @brand,
          "cc": @cc,
          "from": @from,
          "html": @html,
          "reply_to": @reply_to,
          "subject": @subject,
          "text": @text,
          "tracking": @tracking
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.bcc&.is_a?(String) != false || raise("Passed value for field obj.bcc is not the expected type, validation failed.")
        obj.brand.nil? || Brands::Brand.validate_raw(obj: obj.brand)
        obj.cc&.is_a?(String) != false || raise("Passed value for field obj.cc is not the expected type, validation failed.")
        obj.from&.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
        obj.html&.is_a?(String) != false || raise("Passed value for field obj.html is not the expected type, validation failed.")
        obj.reply_to&.is_a?(String) != false || raise("Passed value for field obj.reply_to is not the expected type, validation failed.")
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
        Send::TrackingOverride.validate_raw(obj: obj.tracking)
      end
    end
  end
end

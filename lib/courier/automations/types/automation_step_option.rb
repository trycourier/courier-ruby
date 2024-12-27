# frozen_string_literal: true

require "json"
require_relative "automation_add_to_digest_step"
require_relative "automation_add_to_batch_step"
require_relative "automation_throttle_step"
require_relative "automation_cancel_step"
require_relative "automation_delay_step"
require_relative "automation_fetch_data_step"
require_relative "automation_invoke_step"
require_relative "automation_send_step"
require_relative "automation_v_2_send_step"
require_relative "automation_send_list_step"
require_relative "automation_update_profile_step"

module Courier
  class Automations
    class AutomationStepOption
      # Deserialize a JSON object to an instance of AutomationStepOption
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationStepOption]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Automations::AutomationAddToDigestStep.validate_raw(obj: struct)
          return Automations::AutomationAddToDigestStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationAddToBatchStep.validate_raw(obj: struct)
          return Automations::AutomationAddToBatchStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationThrottleStep.validate_raw(obj: struct)
          return Automations::AutomationThrottleStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationCancelStep.validate_raw(obj: struct)
          return Automations::AutomationCancelStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationDelayStep.validate_raw(obj: struct)
          return Automations::AutomationDelayStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationFetchDataStep.validate_raw(obj: struct)
          return Automations::AutomationFetchDataStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationInvokeStep.validate_raw(obj: struct)
          return Automations::AutomationInvokeStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationSendStep.validate_raw(obj: struct)
          return Automations::AutomationSendStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationV2SendStep.validate_raw(obj: struct)
          return Automations::AutomationV2SendStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationSendListStep.validate_raw(obj: struct)
          return Automations::AutomationSendListStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Automations::AutomationUpdateProfileStep.validate_raw(obj: struct)
          return Automations::AutomationUpdateProfileStep.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Automations::AutomationAddToDigestStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationAddToBatchStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationThrottleStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationCancelStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationDelayStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationFetchDataStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationInvokeStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationSendStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationV2SendStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationSendListStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Automations::AutomationUpdateProfileStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  class Automations
    # @type [AUTOMATION_STEP_ACTION]
    AUTOMATION_STEP_ACTION = {
      cancel: "cancel",
      delay: "delay",
      invoke: "invoke",
      send: "send",
      send_list: "send-list",
      update_profile: "update-profile"
    }.freeze
  end
end

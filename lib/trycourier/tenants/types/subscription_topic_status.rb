# frozen_string_literal: true

module Courier
  class Tenants
    # @type [SUBSCRIPTION_TOPIC_STATUS]
    SUBSCRIPTION_TOPIC_STATUS = { opted_out: "OPTED_OUT", opted_in: "OPTED_IN", required: "REQUIRED" }.freeze
  end
end

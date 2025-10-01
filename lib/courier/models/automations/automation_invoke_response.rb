# frozen_string_literal: true

module Courier
  module Models
    module Automations
      class AutomationInvokeResponse < Courier::Internal::Type::BaseModel
        # @!attribute run_id
        #
        #   @return [String]
        required :run_id, String, api_name: :runId

        # @!method initialize(run_id:)
        #   @param run_id [String]
      end
    end

    AutomationInvokeResponse = Automations::AutomationInvokeResponse
  end
end

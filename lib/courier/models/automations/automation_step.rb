# frozen_string_literal: true

module Courier
  module Models
    module Automations
      class AutomationStep < Courier::Internal::Type::BaseModel
        # @!attribute if_
        #
        #   @return [String, nil]
        optional :if_, String, api_name: :if, nil?: true

        # @!attribute ref
        #
        #   @return [String, nil]
        optional :ref, String, nil?: true

        # @!method initialize(if_: nil, ref: nil)
        #   @param if_ [String, nil]
        #   @param ref [String, nil]
      end
    end

    AutomationStep = Automations::AutomationStep
  end
end

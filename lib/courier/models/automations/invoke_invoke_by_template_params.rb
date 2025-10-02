# frozen_string_literal: true

module Courier
  module Models
    module Automations
      # @see Courier::Resources::Automations::Invoke#invoke_by_template
      class InvokeInvokeByTemplateParams < Courier::Models::Automations::AutomationInvokeParams
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!method initialize(request_options: {})
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

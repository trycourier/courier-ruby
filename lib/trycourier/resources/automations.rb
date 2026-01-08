# frozen_string_literal: true

module Trycourier
  module Resources
    class Automations
      # @return [Trycourier::Resources::Automations::Invoke]
      attr_reader :invoke

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::AutomationListParams} for more details.
      #
      # Get the list of automations.
      #
      # @overload list(cursor: nil, version: nil, request_options: {})
      #
      # @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      # @param version [Symbol, Trycourier::Models::AutomationListParams::Version] The version of templates to retrieve. Accepted values are published (for publish
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AutomationTemplateListResponse]
      #
      # @see Trycourier::Models::AutomationListParams
      def list(params = {})
        parsed, options = Trycourier::AutomationListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "automations",
          query: parsed,
          model: Trycourier::AutomationTemplateListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @invoke = Trycourier::Resources::Automations::Invoke.new(client: client)
      end
    end
  end
end

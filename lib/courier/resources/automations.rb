# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      # @return [Courier::Resources::Automations::Invoke]
      attr_reader :invoke

      # Some parameter documentations has been truncated, see
      # {Courier::Models::AutomationListParams} for more details.
      #
      # Get the list of automations.
      #
      # @overload list(cursor: nil, version: nil, request_options: {})
      #
      # @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      # @param version [Symbol, Courier::Models::AutomationListParams::Version] The version of templates to retrieve. Accepted values are published (for publish
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AutomationTemplateListResponse]
      #
      # @see Courier::Models::AutomationListParams
      def list(params = {})
        parsed, options = Courier::AutomationListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "automations",
          query: query,
          model: Courier::AutomationTemplateListResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @invoke = Courier::Resources::Automations::Invoke.new(client: client)
      end
    end
  end
end

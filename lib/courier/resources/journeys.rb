# frozen_string_literal: true

module Courier
  module Resources
    class Journeys
      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyListParams} for more details.
      #
      # Get the list of journeys.
      #
      # @overload list(cursor: nil, version: nil, request_options: {})
      #
      # @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      # @param version [Symbol, Courier::Models::JourneyListParams::Version] The version of journeys to retrieve. Accepted values are published (for publishe
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneysListResponse]
      #
      # @see Courier::Models::JourneyListParams
      def list(params = {})
        parsed, options = Courier::JourneyListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "journeys",
          query: query,
          model: Courier::JourneysListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyInvokeParams} for more details.
      #
      # Invoke a journey run from a journey template.
      #
      # @overload invoke(template_id, data: nil, profile: nil, user_id: nil, request_options: {})
      #
      # @param template_id [String] A unique identifier representing the journey template to be invoked. This could
      #
      # @param data [Hash{Symbol=>Object}] Data payload passed to the journey. The expected shape can be predefined using t
      #
      # @param profile [Hash{Symbol=>Object}] Profile data for the user. Can contain contact information (email, phone_number)
      #
      # @param user_id [String] A unique identifier for the user. If not provided, the system will attempt to re
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneysInvokeResponse]
      #
      # @see Courier::Models::JourneyInvokeParams
      def invoke(template_id, params = {})
        parsed, options = Courier::JourneyInvokeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["journeys/%1$s/invoke", template_id],
          body: parsed,
          model: Courier::JourneysInvokeResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Resources
    # Report suspected bugs, confusing behavior and missing features in Courier, from
    # an AI agent, a developer tool or by hand.
    class Feedback
      # Some parameter documentations has been truncated, see
      # {Courier::Models::FeedbackCreateParams} for more details.
      #
      # Reports a suspected bug, confusing behavior or a missing feature in Courier. It
      # is built for AI agents and developer tools to call when Courier does something
      # unexpected, and people can call it too.
      #
      # A report is not a support ticket. A `201` means Courier stored the report; it
      # does not promise a reply or a fix. For help with your account, contact Courier
      # support.
      #
      # Never include secrets, API keys or customer data such as recipient names, email
      # addresses or message content.
      #
      # Requires an API key with no scope restrictions; a JWT or a scoped API key is
      # refused. Each workspace can submit 200 reports per UTC day, and requests that
      # fail validation count toward that limit.
      #
      # @overload create(category:, description:, surface:, title:, expected_behavior: nil, harness: nil, location: nil, model: nil, request_id: nil, request_options: {})
      #
      # @param category [Symbol, Courier::Models::FeedbackCreateParams::Category] What kind of report this is: `possible_bug` for behavior that looks wrong, `conf
      #
      # @param description [String] What happened, in enough detail for someone at Courier to follow it.
      #
      # @param surface [Symbol, Courier::Models::FeedbackCreateParams::Surface] Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server, t
      #
      # @param title [String] A one-line summary of the report.
      #
      # @param expected_behavior [String] What you expected to happen instead.
      #
      # @param harness [String] The agent or tool that submitted the report, such as `Claude Code`.
      #
      # @param location [String] Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP too
      #
      # @param model [String] The AI model that submitted the report, such as `claude-opus-5-5`.
      #
      # @param request_id [String] The request ID of an API call that shows the problem, if there is one.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::FeedbackCreateResponse]
      #
      # @see Courier::Models::FeedbackCreateParams
      def create(params)
        parsed, options = Courier::FeedbackCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "feedback",
          body: parsed,
          model: Courier::Models::FeedbackCreateResponse,
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

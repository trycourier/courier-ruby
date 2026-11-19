# typed: strong

module Courier
  module Resources
    # Report suspected bugs, confusing behavior and missing features in Courier, from
    # an AI agent, a developer tool or by hand.
    class Feedback
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
      sig do
        params(
          category: Courier::FeedbackCreateParams::Category::OrSymbol,
          description: String,
          surface: Courier::FeedbackCreateParams::Surface::OrSymbol,
          title: String,
          expected_behavior: String,
          harness: String,
          location: String,
          model: String,
          request_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::FeedbackCreateResponse)
      end
      def create(
        # What kind of report this is: `possible_bug` for behavior that looks wrong,
        # `confusing_behavior` for behavior that works but was hard to understand,
        # `feature_request` for something Courier does not do yet, and `other`.
        category:,
        # What happened, in enough detail for someone at Courier to follow it.
        description:,
        # Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
        # the Courier app `ui`, the `docs`, or `other`.
        surface:,
        # A one-line summary of the report.
        title:,
        # What you expected to happen instead.
        expected_behavior: nil,
        # The agent or tool that submitted the report, such as `Claude Code`.
        harness: nil,
        # Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP
        # tool name or a docs URL.
        location: nil,
        # The AI model that submitted the report, such as `claude-opus-5-5`.
        model: nil,
        # The request ID of an API call that shows the problem, if there is one.
        request_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end

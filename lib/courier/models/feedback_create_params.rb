# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Feedback#create
    class FeedbackCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute category
      #   What kind of report this is: `possible_bug` for behavior that looks wrong,
      #   `confusing_behavior` for behavior that works but was hard to understand,
      #   `feature_request` for something Courier does not do yet, and `other`.
      #
      #   @return [Symbol, Courier::Models::FeedbackCreateParams::Category]
      required :category, enum: -> { Courier::FeedbackCreateParams::Category }

      # @!attribute description
      #   What happened, in enough detail for someone at Courier to follow it.
      #
      #   @return [String]
      required :description, String

      # @!attribute surface
      #   Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
      #   the Courier app `ui`, the `docs`, or `other`.
      #
      #   @return [Symbol, Courier::Models::FeedbackCreateParams::Surface]
      required :surface, enum: -> { Courier::FeedbackCreateParams::Surface }

      # @!attribute title
      #   A one-line summary of the report.
      #
      #   @return [String]
      required :title, String

      # @!attribute expected_behavior
      #   What you expected to happen instead.
      #
      #   @return [String, nil]
      optional :expected_behavior, String

      # @!attribute harness
      #   The agent or tool that submitted the report, such as `Claude Code`.
      #
      #   @return [String, nil]
      optional :harness, String

      # @!attribute location
      #   Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP
      #   tool name or a docs URL.
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute model
      #   The AI model that submitted the report, such as `claude-opus-5-5`.
      #
      #   @return [String, nil]
      optional :model, String

      # @!attribute request_id
      #   The request ID of an API call that shows the problem, if there is one.
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!method initialize(category:, description:, surface:, title:, expected_behavior: nil, harness: nil, location: nil, model: nil, request_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::FeedbackCreateParams} for more details.
      #
      #   @param category [Symbol, Courier::Models::FeedbackCreateParams::Category] What kind of report this is: `possible_bug` for behavior that looks wrong, `conf
      #
      #   @param description [String] What happened, in enough detail for someone at Courier to follow it.
      #
      #   @param surface [Symbol, Courier::Models::FeedbackCreateParams::Surface] Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server, t
      #
      #   @param title [String] A one-line summary of the report.
      #
      #   @param expected_behavior [String] What you expected to happen instead.
      #
      #   @param harness [String] The agent or tool that submitted the report, such as `Claude Code`.
      #
      #   @param location [String] Where it happened, such as an endpoint (`POST /send`), an SDK method, an MCP too
      #
      #   @param model [String] The AI model that submitted the report, such as `claude-opus-5-5`.
      #
      #   @param request_id [String] The request ID of an API call that shows the problem, if there is one.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      # What kind of report this is: `possible_bug` for behavior that looks wrong,
      # `confusing_behavior` for behavior that works but was hard to understand,
      # `feature_request` for something Courier does not do yet, and `other`.
      module Category
        extend Courier::Internal::Type::Enum

        POSSIBLE_BUG = :possible_bug
        CONFUSING_BEHAVIOR = :confusing_behavior
        FEATURE_REQUEST = :feature_request
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Where you met the problem: the REST `api`, an `sdk`, the Courier `mcp` server,
      # the Courier app `ui`, the `docs`, or `other`.
      module Surface
        extend Courier::Internal::Type::Enum

        API = :api
        SDK = :sdk
        MCP = :mcp
        UI = :ui
        DOCS = :docs
        OTHER = :other

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

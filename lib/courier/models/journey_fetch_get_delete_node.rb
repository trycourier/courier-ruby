# frozen_string_literal: true

module Courier
  module Models
    class JourneyFetchGetDeleteNode < Courier::Internal::Type::BaseModel
      # @!attribute merge_strategy
      #   Strategy for merging a fetch response into the journey run state.
      #
      #   @return [Symbol, Courier::Models::JourneyMergeStrategy]
      required :merge_strategy, enum: -> { Courier::JourneyMergeStrategy }

      # @!attribute method_
      #
      #   @return [Symbol, Courier::Models::JourneyFetchGetDeleteNode::Method]
      required :method_, enum: -> { Courier::JourneyFetchGetDeleteNode::Method }, api_name: :method

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyFetchGetDeleteNode::Type]
      required :type, enum: -> { Courier::JourneyFetchGetDeleteNode::Type }

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute conditions
      #   Condition spec for a journey node. Accepts a single condition atom, an AND/OR
      #   group, or an AND/OR nested group. Omit the `conditions` property entirely to
      #   express "no conditions".
      #
      #   @return [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup, nil]
      optional :conditions, union: -> { Courier::JourneyConditionsField }

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Courier::Internal::Type::HashOf[String]

      # @!attribute query_params
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :query_params, Courier::Internal::Type::HashOf[String]

      # @!attribute response_schema
      #   A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :response_schema, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!method initialize(merge_strategy:, method_:, type:, url:, id: nil, conditions: nil, headers: nil, query_params: nil, response_schema: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyFetchGetDeleteNode} for more details.
      #
      #   Issue an HTTP GET or DELETE request and merge the response into the journey
      #   state per `merge_strategy`.
      #
      #   @param merge_strategy [Symbol, Courier::Models::JourneyMergeStrategy] Strategy for merging a fetch response into the journey run state.
      #
      #   @param method_ [Symbol, Courier::Models::JourneyFetchGetDeleteNode::Method]
      #
      #   @param type [Symbol, Courier::Models::JourneyFetchGetDeleteNode::Type]
      #
      #   @param url [String]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param query_params [Hash{Symbol=>String}]
      #
      #   @param response_schema [Hash{Symbol=>Object}] A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.

      # @see Courier::Models::JourneyFetchGetDeleteNode#method_
      module Method
        extend Courier::Internal::Type::Enum

        GET = :get
        DELETE = :delete

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyFetchGetDeleteNode#type
      module Type
        extend Courier::Internal::Type::Enum

        FETCH = :fetch

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    class JourneyFetchPostPutNode < Courier::Internal::Type::BaseModel
      # @!attribute merge_strategy
      #
      #   @return [Symbol, Courier::Models::JourneyMergeStrategy]
      required :merge_strategy, enum: -> { Courier::JourneyMergeStrategy }

      # @!attribute method_
      #
      #   @return [Symbol, Courier::Models::JourneyFetchPostPutNode::Method]
      required :method_, enum: -> { Courier::JourneyFetchPostPutNode::Method }, api_name: :method

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyFetchPostPutNode::Type]
      required :type, enum: -> { Courier::JourneyFetchPostPutNode::Type }

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute body
      #
      #   @return [String, nil]
      optional :body, String

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

      # @!method initialize(merge_strategy:, method_:, type:, url:, id: nil, body: nil, conditions: nil, headers: nil, query_params: nil, response_schema: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyFetchPostPutNode} for more details.
      #
      #   @param merge_strategy [Symbol, Courier::Models::JourneyMergeStrategy]
      #
      #   @param method_ [Symbol, Courier::Models::JourneyFetchPostPutNode::Method]
      #
      #   @param type [Symbol, Courier::Models::JourneyFetchPostPutNode::Type]
      #
      #   @param url [String]
      #
      #   @param id [String]
      #
      #   @param body [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param query_params [Hash{Symbol=>String}]
      #
      #   @param response_schema [Hash{Symbol=>Object}] A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.

      # @see Courier::Models::JourneyFetchPostPutNode#method_
      module Method
        extend Courier::Internal::Type::Enum

        POST = :post
        PUT = :put

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyFetchPostPutNode#type
      module Type
        extend Courier::Internal::Type::Enum

        FETCH = :fetch

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

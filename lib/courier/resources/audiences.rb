# frozen_string_literal: true

module Courier
  module Resources
    # Define filter-based groups whose membership Courier recalculates as user
    # profiles change.
    class Audiences
      # Returns one audience with its name, description, and the filter and AND or OR
      # operator that decide which users belong to it.
      #
      # @overload retrieve(audience_id, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience_id
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Audience]
      #
      # @see Courier::Models::AudienceRetrieveParams
      def retrieve(audience_id, params = {})
        @client.request(
          method: :get,
          path: ["audiences/%1$s", audience_id],
          model: Courier::Audience,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::AudienceUpdateParams} for more details.
      #
      # Creates or replaces an audience from a filter and an AND or OR operator.
      # Membership recalculates automatically as profiles change.
      #
      # @overload update(audience_id, description: nil, filter: nil, name: nil, operator: nil, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param description [String, nil] A description of the audience
      #
      # @param filter [Courier::Models::AudienceFilterConfig, nil] Filter configuration for audience membership containing an array of filter rules
      #
      # @param name [String, nil] The name of the audience
      #
      # @param operator [Symbol, Courier::Models::AudienceUpdateParams::Operator, nil] The logical operator (AND/OR) combining the top-level `filter.filters`. Convenie
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AudienceUpdateResponse]
      #
      # @see Courier::Models::AudienceUpdateParams
      def update(audience_id, params = {})
        parsed, options = Courier::AudienceUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["audiences/%1$s", audience_id],
          body: parsed,
          model: Courier::Models::AudienceUpdateResponse,
          options: options
        )
      end

      # Returns the audiences in the workspace with paging. Audiences are filter-based
      # groups that recalculate as user profiles change.
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of audiences
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AudienceListResponse]
      #
      # @see Courier::Models::AudienceListParams
      def list(params = {})
        parsed, options = Courier::AudienceListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "audiences",
          query: query,
          model: Courier::Models::AudienceListResponse,
          options: options
        )
      end

      # Deletes an audience permanently, so update any caller sending to it by audience
      # id first. Those sends fail once the audience is gone.
      #
      # @overload delete(audience_id, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::AudienceDeleteParams
      def delete(audience_id, params = {})
        @client.request(
          method: :delete,
          path: ["audiences/%1$s", audience_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Returns the users currently matching an audience filter, with paging. Membership
      # is recalculated, so results shift as profiles change.
      #
      # @overload list_members(audience_id, cursor: nil, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of members
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::AudienceListMembersResponse]
      #
      # @see Courier::Models::AudienceListMembersParams
      def list_members(audience_id, params = {})
        parsed, options = Courier::AudienceListMembersParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["audiences/%1$s/members", audience_id],
          query: query,
          model: Courier::Models::AudienceListMembersResponse,
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

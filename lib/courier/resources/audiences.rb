# frozen_string_literal: true

module Courier
  module Resources
    class Audiences
      # Returns the specified audience by id.
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

      # Creates or updates audience.
      #
      # @overload update(audience_id, description: nil, filter: nil, name: nil, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param description [String, nil] A description of the audience
      #
      # @param filter [Courier::Models::Filter, nil] A single filter to use for filtering
      #
      # @param name [String, nil] The name of the audience
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

      # Get the audiences associated with the authorization token.
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
        @client.request(
          method: :get,
          path: "audiences",
          query: parsed,
          model: Courier::Models::AudienceListResponse,
          options: options
        )
      end

      # Deletes the specified audience.
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

      # Get list of members of an audience.
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
        @client.request(
          method: :get,
          path: ["audiences/%1$s/members", audience_id],
          query: parsed,
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

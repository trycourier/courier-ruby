# frozen_string_literal: true

module Trycourier
  module Resources
    class Audiences
      # Returns the specified audience by id.
      #
      # @overload retrieve(audience_id, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience_id
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Audience]
      #
      # @see Trycourier::Models::AudienceRetrieveParams
      def retrieve(audience_id, params = {})
        @client.request(
          method: :get,
          path: ["audiences/%1$s", audience_id],
          model: Trycourier::Audience,
          options: params[:request_options]
        )
      end

      # Creates or updates audience.
      #
      # @overload update(audience_id, description: nil, filter: nil, name: nil, operator: nil, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param description [String, nil] A description of the audience
      #
      # @param filter [Trycourier::Models::Filter, nil] Filter that contains an array of FilterConfig items
      #
      # @param name [String, nil] The name of the audience
      #
      # @param operator [Symbol, Trycourier::Models::AudienceUpdateParams::Operator, nil] The logical operator (AND/OR) for the top-level filter
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AudienceUpdateResponse]
      #
      # @see Trycourier::Models::AudienceUpdateParams
      def update(audience_id, params = {})
        parsed, options = Trycourier::AudienceUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["audiences/%1$s", audience_id],
          body: parsed,
          model: Trycourier::Models::AudienceUpdateResponse,
          options: options
        )
      end

      # Get the audiences associated with the authorization token.
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of audiences
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AudienceListResponse]
      #
      # @see Trycourier::Models::AudienceListParams
      def list(params = {})
        parsed, options = Trycourier::AudienceListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "audiences",
          query: parsed,
          model: Trycourier::Models::AudienceListResponse,
          options: options
        )
      end

      # Deletes the specified audience.
      #
      # @overload delete(audience_id, request_options: {})
      #
      # @param audience_id [String] A unique identifier representing the audience id
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::AudienceDeleteParams
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
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::AudienceListMembersResponse]
      #
      # @see Trycourier::Models::AudienceListMembersParams
      def list_members(audience_id, params = {})
        parsed, options = Trycourier::AudienceListMembersParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["audiences/%1$s/members", audience_id],
          query: parsed,
          model: Trycourier::Models::AudienceListMembersResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end

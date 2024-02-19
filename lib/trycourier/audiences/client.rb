# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/audience"
require_relative "types/filter"
require_relative "types/audience_update_response"
require_relative "types/audience_member_list_response"
require_relative "types/audience_list_response"
require "async"

module Courier
  class AudiencesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [AudiencesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Returns the specified audience by id.
    #
    # @param audience_id [String] A unique identifier representing the audience_id
    # @param request_options [RequestOptions]
    # @return [Audiences::Audience]
    def get(audience_id:, request_options: nil)
      response = @request_client.conn.get("/audiences/#{audience_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Audiences::Audience.from_json(json_object: response.body)
    end

    # Creates or updates audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param name [String] The name of the audience
    # @param description [String] A description of the audience
    # @param filter [Hash] Request of type Audiences::Filter, as a Hash
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceUpdateResponse]
    def update(audience_id:, name: nil, description: nil, filter: nil, request_options: nil)
      response = @request_client.conn.put("/audiences/#{audience_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          description: description,
          filter: filter
        }.compact
      end
      Audiences::AudienceUpdateResponse.from_json(json_object: response.body)
    end

    # Deletes the specified audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(audience_id:, request_options: nil)
      @request_client.conn.delete("/audiences/#{audience_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Get list of members of an audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param cursor [String] A unique identifier that allows for fetching the next set of members
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceMemberListResponse]
    def list_members(audience_id:, cursor: nil, request_options: nil)
      response = @request_client.conn.get("/audiences/#{audience_id}/members") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Audiences::AudienceMemberListResponse.from_json(json_object: response.body)
    end

    # Get the audiences associated with the authorization token.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of audiences
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceListResponse]
    def list_audiences(cursor: nil, request_options: nil)
      response = @request_client.conn.get("/audiences") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Audiences::AudienceListResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAudiencesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncAudiencesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Returns the specified audience by id.
    #
    # @param audience_id [String] A unique identifier representing the audience_id
    # @param request_options [RequestOptions]
    # @return [Audiences::Audience]
    def get(audience_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/audiences/#{audience_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Audiences::Audience.from_json(json_object: response.body)
      end
    end

    # Creates or updates audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param name [String] The name of the audience
    # @param description [String] A description of the audience
    # @param filter [Hash] Request of type Audiences::Filter, as a Hash
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceUpdateResponse]
    def update(audience_id:, name: nil, description: nil, filter: nil, request_options: nil)
      Async do
        response = @request_client.conn.put("/audiences/#{audience_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            description: description,
            filter: filter
          }.compact
        end
        Audiences::AudienceUpdateResponse.from_json(json_object: response.body)
      end
    end

    # Deletes the specified audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(audience_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/audiences/#{audience_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Get list of members of an audience.
    #
    # @param audience_id [String] A unique identifier representing the audience id
    # @param cursor [String] A unique identifier that allows for fetching the next set of members
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceMemberListResponse]
    def list_members(audience_id:, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/audiences/#{audience_id}/members") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Audiences::AudienceMemberListResponse.from_json(json_object: response.body)
      end
    end

    # Get the audiences associated with the authorization token.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next set of audiences
    # @param request_options [RequestOptions]
    # @return [Audiences::AudienceListResponse]
    def list_audiences(cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/audiences") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Audiences::AudienceListResponse.from_json(json_object: response.body)
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Resources
    class Users
      class Tokens
        # Get single token available for a `:token`
        #
        # @overload retrieve(token, user_id:, request_options: {})
        #
        # @param token [String] The full token string.
        #
        # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::TokenRetrieveResponse]
        #
        # @see Courier::Models::Users::TokenRetrieveParams
        def retrieve(token, params)
          parsed, options = Courier::Users::TokenRetrieveParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["users/%1$s/tokens/%2$s", user_id, token],
            model: Courier::Models::Users::TokenRetrieveResponse,
            options: options
          )
        end

        # Apply a JSON Patch (RFC 6902) to the specified token.
        #
        # @overload update(token, user_id:, patch:, request_options: {})
        #
        # @param token [String] Path param: The full token string.
        #
        # @param user_id [String] Path param: The user's ID. This can be any uniquely identifiable string.
        #
        # @param patch [Array<Courier::Models::Users::TokenUpdateParams::Patch>] Body param
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::TokenUpdateParams
        def update(token, params)
          parsed, options = Courier::Users::TokenUpdateParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["users/%1$s/tokens/%2$s", user_id, token],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Gets all tokens available for a :user_id
        #
        # @overload list(user_id, request_options: {})
        #
        # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::TokenListResponse]
        #
        # @see Courier::Models::Users::TokenListParams
        def list(user_id, params = {})
          @client.request(
            method: :get,
            path: ["users/%1$s/tokens", user_id],
            model: Courier::Models::Users::TokenListResponse,
            options: params[:request_options]
          )
        end

        # Delete User Token
        #
        # @overload delete(token, user_id:, request_options: {})
        #
        # @param token [String] The full token string.
        #
        # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::TokenDeleteParams
        def delete(token, params)
          parsed, options = Courier::Users::TokenDeleteParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["users/%1$s/tokens/%2$s", user_id, token],
            model: NilClass,
            options: options
          )
        end

        # Adds multiple tokens to a user and overwrites matching existing tokens.
        #
        # @overload add_multiple(user_id, request_options: {})
        #
        # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::TokenAddMultipleParams
        def add_multiple(user_id, params = {})
          @client.request(
            method: :put,
            path: ["users/%1$s/tokens", user_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::TokenAddSingleParams} for more details.
        #
        # Adds a single token to a user and overwrites a matching existing token.
        #
        # @overload add_single(token, user_id:, provider_key:, device: nil, expiry_date: nil, properties: nil, tracking: nil, request_options: {})
        #
        # @param token [String] Path param: The full token string.
        #
        # @param user_id [String] Path param: The user's ID. This can be any uniquely identifiable string.
        #
        # @param provider_key [Symbol, Courier::Models::Users::TokenAddSingleParams::ProviderKey] Body param
        #
        # @param device [Courier::Models::Users::TokenAddSingleParams::Device, nil] Body param: Information about the device the token came from.
        #
        # @param expiry_date [String, Boolean, nil] Body param: ISO 8601 formatted date the token expires. Defaults to 2 months. Set
        #
        # @param properties [Object] Body param: Properties about the token.
        #
        # @param tracking [Courier::Models::Users::TokenAddSingleParams::Tracking, nil] Body param: Tracking information about the device the token came from.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::TokenAddSingleParams
        def add_single(token, params)
          parsed, options = Courier::Users::TokenAddSingleParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["users/%1$s/tokens/%2$s", user_id, token],
            body: parsed,
            model: NilClass,
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
end

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
        # @param patch [Array<Courier::Models::Users::TokenUpdateParams::Patch>] Body param:
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
        # @return [Array<Courier::Models::UserToken>]
        #
        # @see Courier::Models::Users::TokenListParams
        def list(user_id, params = {})
          @client.request(
            method: :get,
            path: ["users/%1$s/tokens", user_id],
            model: Courier::Internal::Type::ArrayOf[Courier::UserToken],
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
        # @overload add_single(path_token, user_id:, provider_key:, body_token: nil, device: nil, expiry_date: nil, properties: nil, tracking: nil, request_options: {})
        #
        # @param path_token [String] Path param: The full token string.
        #
        # @param user_id [String] Path param: The user's ID. This can be any uniquely identifiable string.
        #
        # @param provider_key [Symbol, Courier::Models::UserToken::ProviderKey] Body param:
        #
        # @param body_token [String, nil] Body param: Full body of the token. Must match token in URL.
        #
        # @param device [Courier::Models::UserToken::Device, nil] Body param: Information about the device the token is associated with.
        #
        # @param expiry_date [String, Boolean, nil] Body param: ISO 8601 formatted date the token expires. Defaults to 2 months. Set
        #
        # @param properties [Object] Body param: Properties sent to the provider along with the token
        #
        # @param tracking [Courier::Models::UserToken::Tracking, nil] Body param: Information about the device the token is associated with.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::TokenAddSingleParams
        def add_single(path_token, params)
          parsed, options = Courier::Users::TokenAddSingleParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["users/%1$s/tokens/%2$s", user_id, path_token],
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

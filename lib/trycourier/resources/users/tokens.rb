# frozen_string_literal: true

module Trycourier
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
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Users::TokenRetrieveResponse]
        #
        # @see Trycourier::Models::Users::TokenRetrieveParams
        def retrieve(token, params)
          parsed, options = Trycourier::Users::TokenRetrieveParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["users/%1$s/tokens/%2$s", user_id, token],
            model: Trycourier::Models::Users::TokenRetrieveResponse,
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
        # @param patch [Array<Trycourier::Models::Users::TokenUpdateParams::Patch>] Body param:
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TokenUpdateParams
        def update(token, params)
          parsed, options = Trycourier::Users::TokenUpdateParams.dump_request(params)
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
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Array<Trycourier::Models::Users::UserToken>]
        #
        # @see Trycourier::Models::Users::TokenListParams
        def list(user_id, params = {})
          @client.request(
            method: :get,
            path: ["users/%1$s/tokens", user_id],
            model: Trycourier::Internal::Type::ArrayOf[Trycourier::Users::UserToken],
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
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TokenDeleteParams
        def delete(token, params)
          parsed, options = Trycourier::Users::TokenDeleteParams.dump_request(params)
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
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TokenAddMultipleParams
        def add_multiple(user_id, params = {})
          @client.request(
            method: :put,
            path: ["users/%1$s/tokens", user_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Users::TokenAddSingleParams} for more details.
        #
        # Adds a single token to a user and overwrites a matching existing token.
        #
        # @overload add_single(path_token, user_id:, body_token:, provider_key:, device: nil, expiry_date: nil, properties: nil, tracking: nil, request_options: {})
        #
        # @param path_token [String] Path param: The full token string.
        #
        # @param user_id [String] Path param: The user's ID. This can be any uniquely identifiable string.
        #
        # @param body_token [String] Body param: Full body of the token. Must match token in URL path parameter.
        #
        # @param provider_key [Symbol, Trycourier::Models::Users::UserToken::ProviderKey] Body param:
        #
        # @param device [Trycourier::Models::Users::UserToken::Device, nil] Body param: Information about the device the token came from.
        #
        # @param expiry_date [String, Boolean, nil] Body param: ISO 8601 formatted date the token expires. Defaults to 2 months. Set
        #
        # @param properties [Object] Body param: Properties sent to the provider along with the token
        #
        # @param tracking [Trycourier::Models::Users::UserToken::Tracking, nil] Body param: Tracking information about the device the token came from.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TokenAddSingleParams
        def add_single(path_token, params)
          parsed, options = Trycourier::Users::TokenAddSingleParams.dump_request(params)
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
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end

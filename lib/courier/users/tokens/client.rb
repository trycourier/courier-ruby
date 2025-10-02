# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      class Client
        # @return [Courier::Users::Tokens::Client]
        def initialize(client:)
          @client = client
        end

        # Adds multiple tokens to a user and overwrites matching existing tokens.
        #
        # @return [untyped]
        def add_multiple(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PUT",
            path: "/users/#{params[:user_id]}/tokens"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end

        # Adds a single token to a user and overwrites a matching existing token.
        #
        # @return [untyped]
        def add(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PUT",
            path: "/users/#{params[:user_id]}/tokens/#{params[:token]}",
            body: Courier::Users::Tokens::Types::UserToken.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end

        # Apply a JSON Patch (RFC 6902) to the specified token.
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PATCH",
            path: "/users/#{params[:user_id]}/tokens/#{params[:token]}",
            body: Courier::Users::Tokens::Types::PatchUserTokenOpts.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end

        # Get single token available for a `:token`
        #
        # @return [Courier::Users::Tokens::Types::GetUserTokenResponse]
        def get(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "GET",
            path: "/users/#{params[:user_id]}/tokens/#{params[:token]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Tokens::Types::GetUserTokenResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Gets all tokens available for a :user_id
        #
        # @return [Array[Courier::Users::Tokens::Types::UserToken]]
        def list(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "GET",
            path: "/users/#{params[:user_id]}/tokens"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Tokens::Types::GetAllTokensResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "DELETE",
            path: "/users/#{params[:user_id]}/tokens/#{params[:token]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          return if code.between?(200, 299)

          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end

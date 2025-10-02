# frozen_string_literal: true

module Courier
  module Users
    module Tenants
      class Client
        # @return [Courier::Users::Tenants::Client]
        def initialize(client:)
          @client = client
        end

        # This endpoint is used to add a user to
        # multiple tenants in one call.
        # A custom profile can also be supplied for each tenant.
        # This profile will be merged with the user's main
        # profile when sending to the user with that tenant.
        #
        # @return [untyped]
        def add_multple(request_options: {}, **params)
          _path_param_names = ["user_id"]

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PUT",
            path: "users/#{params[:user_id]}/tenants",
            body: params.except(*_path_param_names)
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

        # This endpoint is used to add a single tenant.
        #
        # A custom profile can also be supplied with the tenant.
        # This profile will be merged with the user's main profile
        # when sending to the user with that tenant.
        #
        # @return [untyped]
        def add(request_options: {}, **params)
          _path_param_names = %w[user_id tenant_id]

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PUT",
            path: "users/#{params[:user_id]}/tenants/#{params[:tenant_id]}",
            body: params.except(*_path_param_names)
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

        # Removes a user from any tenants they may have been associated with.
        #
        # @return [untyped]
        def remove_all(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "DELETE",
            path: "users/#{params[:user_id]}/tenants"
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

        # Removes a user from the supplied tenant.
        #
        # @return [untyped]
        def remove(request_options: {}, **params)
          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "DELETE",
            path: "users/#{params[:user_id]}/tenants/#{params[:tenant_id]}"
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

        # Returns a paginated list of user tenant associations.
        #
        # @return [Courier::Users::Tenants::Types::ListTenantsForUserResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[limit cursor],
            %i[limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "GET",
            path: "users/#{params[:user_id]}/tenants",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Tenants::Types::ListTenantsForUserResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end

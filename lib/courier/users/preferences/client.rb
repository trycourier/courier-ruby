# frozen_string_literal: true

module Courier
  module Users
    module Preferences
      class Client
        # @return [Courier::Users::Preferences::Client]
        def initialize(client:)
          @client = client
        end

        # Fetch all user preferences.
        #
        # @return [Courier::Users::Preferences::Types::UserPreferencesListResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            ["tenant_id"],
            %i[tenant_id]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "GET",
            path: "/users/#{params[:user_id]}/preferences",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Preferences::Types::UserPreferencesListResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Fetch user preferences for a specific subscription topic.
        #
        # @return [Courier::Users::Preferences::Types::UserPreferencesGetResponse]
        def get(request_options: {}, **params)
          _query_param_names = [
            ["tenant_id"],
            %i[tenant_id]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "GET",
            path: "/users/#{params[:user_id]}/preferences/#{params[:topic_id]}",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Preferences::Types::UserPreferencesGetResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Update or Create user preferences for a specific subscription topic.
        #
        # @return [Courier::Users::Preferences::Types::UserPreferencesUpdateResponse]
        def update(request_options: {}, **params)
          _path_param_names = %w[user_id topic_id]

          _query_param_names = [
            ["tenant_id"],
            %i[tenant_id]
          ].flatten
          _query = params.slice(*_query_param_names)
          params = params.except(*_query_param_names)

          _request = Courier::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
            method: "PUT",
            path: "/users/#{params[:user_id]}/preferences/#{params[:topic_id]}",
            query: _query,
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Courier::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Courier::Users::Preferences::Types::UserPreferencesUpdateResponse.load(_response.body)
          else
            error_class = Courier::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end

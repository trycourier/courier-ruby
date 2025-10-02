# frozen_string_literal: true

module Courier
  module Profiles
    class Client
      # @return [Courier::Profiles::Client]
      def initialize(client:)
        @client = client
      end

      # Returns the specified user profile.
      #
      # @return [Courier::Profiles::Types::ProfileGetResponse]
      def get(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/profiles/#{params[:user_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::ProfileGetResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Merge the supplied values with an existing profile or create a new profile if one doesn't already exist.
      #
      # @return [Courier::Profiles::Types::MergeProfileResponse]
      def create(request_options: {}, **params)
        _path_param_names = ["user_id"]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/profiles/#{params[:user_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::MergeProfileResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # When using `PUT`, be sure to include all the key-value pairs required by the recipient's profile.
      # Any key-value pairs that exist in the profile but fail to be included in the `PUT` request will be
      # removed from the profile. Remember, a `PUT` update is a full replacement of the data. For partial updates,
      # use the [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
      #
      # @return [Courier::Profiles::Types::ReplaceProfileResponse]
      def replace(request_options: {}, **params)
        _path_param_names = ["user_id"]

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PUT",
          path: "/profiles/#{params[:user_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::ReplaceProfileResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # @return [untyped]
      def merge_profile(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "PATCH",
          path: "/profiles/#{params[:user_id]}",
          body: Courier::Profiles::Types::ProfileUpdateRequest.new(params).to_h
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

      # Deletes the specified user profile.
      #
      # @return [untyped]
      def delete(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "DELETE",
          path: "/profiles/#{params[:user_id]}"
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

      # Returns the subscribed lists for a specified user.
      #
      # @return [Courier::Profiles::Types::GetListSubscriptionsResponse]
      def get_list_subscriptions(request_options: {}, **params)
        _query_param_names = [
          ["cursor"],
          %i[cursor]
        ].flatten
        _query = params.slice(*_query_param_names)
        params = params.except(*_query_param_names)

        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "GET",
          path: "/profiles/#{params[:user_id]}/lists",
          query: _query
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::GetListSubscriptionsResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Subscribes the given user to one or more lists. If the list does not exist, it will be created.
      #
      # @return [Courier::Profiles::Types::SubscribeToListsResponse]
      def subscribe_to_lists(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/profiles/#{params[:user_id]}/lists",
          body: Courier::Profiles::Types::SubscribeToListsRequest.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::SubscribeToListsResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Removes all list subscriptions for given user.
      #
      # @return [Courier::Profiles::Types::DeleteListSubscriptionResponse]
      def delete_list_subscription(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "DELETE",
          path: "/profiles/#{params[:user_id]}/lists"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Profiles::Types::DeleteListSubscriptionResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end

# frozen_string_literal: true

module Trycourier
  module Resources
    class Profiles
      # @return [Trycourier::Resources::Profiles::Lists]
      attr_reader :lists

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ProfileCreateParams} for more details.
      #
      # Merge the supplied values with an existing profile or create a new profile if
      # one doesn't already exist.
      #
      # @overload create(user_id, profile:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param profile [Hash{Symbol=>Object}]
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::ProfileCreateResponse]
      #
      # @see Trycourier::Models::ProfileCreateParams
      def create(user_id, params)
        parsed, options = Trycourier::ProfileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: Trycourier::Models::ProfileCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ProfileRetrieveParams} for more details.
      #
      # Returns the specified user profile.
      #
      # @overload retrieve(user_id, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::ProfileRetrieveResponse]
      #
      # @see Trycourier::Models::ProfileRetrieveParams
      def retrieve(user_id, params = {})
        @client.request(
          method: :get,
          path: ["profiles/%1$s", user_id],
          model: Trycourier::Models::ProfileRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ProfileUpdateParams} for more details.
      #
      # Update a profile
      #
      # @overload update(user_id, patch:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
      #
      # @param patch [Array<Trycourier::Models::ProfileUpdateParams::Patch>] List of patch operations to apply to the profile.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::ProfileUpdateParams
      def update(user_id, params)
        parsed, options = Trycourier::ProfileUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ProfileDeleteParams} for more details.
      #
      # Deletes the specified user profile.
      #
      # @overload delete(user_id, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::ProfileDeleteParams
      def delete(user_id, params = {})
        @client.request(
          method: :delete,
          path: ["profiles/%1$s", user_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::ProfileReplaceParams} for more details.
      #
      # When using `PUT`, be sure to include all the key-value pairs required by the
      # recipient's profile. Any key-value pairs that exist in the profile but fail to
      # be included in the `PUT` request will be removed from the profile. Remember, a
      # `PUT` update is a full replacement of the data. For partial updates, use the
      # [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
      #
      # @overload replace(user_id, profile:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
      #
      # @param profile [Hash{Symbol=>Object}]
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::ProfileReplaceResponse]
      #
      # @see Trycourier::Models::ProfileReplaceParams
      def replace(user_id, params)
        parsed, options = Trycourier::ProfileReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: Trycourier::Models::ProfileReplaceResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @lists = Trycourier::Resources::Profiles::Lists.new(client: client)
      end
    end
  end
end

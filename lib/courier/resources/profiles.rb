# frozen_string_literal: true

module Courier
  module Resources
    class Profiles
      # @return [Courier::Resources::Profiles::Lists]
      attr_reader :lists

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileCreateParams} for more details.
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
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ProfileCreateResponse]
      #
      # @see Courier::Models::ProfileCreateParams
      def create(user_id, params)
        parsed, options = Courier::ProfileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: Courier::Models::ProfileCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileRetrieveParams} for more details.
      #
      # Returns the specified user profile.
      #
      # @overload retrieve(user_id, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ProfileRetrieveResponse]
      #
      # @see Courier::Models::ProfileRetrieveParams
      def retrieve(user_id, params = {})
        @client.request(
          method: :get,
          path: ["profiles/%1$s", user_id],
          model: Courier::Models::ProfileRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileUpdateParams} for more details.
      #
      # Update a profile
      #
      # @overload update(user_id, patch:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param patch [Array<Courier::Models::ProfileUpdateParams::Patch>] List of patch operations to apply to the profile.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ProfileUpdateParams
      def update(user_id, params)
        parsed, options = Courier::ProfileUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileDeleteParams} for more details.
      #
      # Deletes the specified user profile.
      #
      # @overload delete(user_id, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ProfileDeleteParams
      def delete(user_id, params = {})
        @client.request(
          method: :delete,
          path: ["profiles/%1$s", user_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileReplaceParams} for more details.
      #
      # When using `PUT`, be sure to include all the key-value pairs required by the
      # recipient's profile. Any key-value pairs that exist in the profile but fail to
      # be included in the `PUT` request will be removed from the profile. Remember, a
      # `PUT` update is a full replacement of the data. For partial updates, use the
      # [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
      #
      # @overload replace(user_id, profile:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested profile.
      #
      # @param profile [Hash{Symbol=>Object}]
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ProfileReplaceResponse]
      #
      # @see Courier::Models::ProfileReplaceParams
      def replace(user_id, params)
        parsed, options = Courier::ProfileReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["profiles/%1$s", user_id],
          body: parsed,
          model: Courier::Models::ProfileReplaceResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @lists = Courier::Resources::Profiles::Lists.new(client: client)
      end
    end
  end
end

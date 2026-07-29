# frozen_string_literal: true

module Courier
  module Resources
    # Store the contact information Courier delivers to for each user — email, phone
    # number, push tokens, and any custom data you send to.
    class Profiles
      # Store the contact information Courier delivers to for each user — email, phone
      # number, push tokens, and any custom data you send to.
      # @return [Courier::Resources::Profiles::Lists]
      attr_reader :lists

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileCreateParams} for more details.
      #
      # Merges the supplied values into a user's profile, creating it if absent and
      # leaving any key you omit untouched. Prefer this for everyday writes.
      #
      # @overload create(user_id, profile:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param user_id [String] Path param: A unique identifier representing the user associated with the reques
      #
      # @param profile [Hash{Symbol=>Object}] Body param
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ProfileCreateResponse]
      #
      # @see Courier::Models::ProfileCreateParams
      def create(user_id, params)
        parsed, options = Courier::ProfileCreateParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: ["profiles/%1$s", user_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::Models::ProfileCreateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProfileRetrieveParams} for more details.
      #
      # Returns a user's stored profile and preferences, including the email address,
      # phone number, and push tokens Courier can reach them on.
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
      # Applies a JSON Patch to a user profile, adding, removing, or replacing
      # individual fields without sending the whole object.
      #
      # @overload update(user_id, patch:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
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
      # Deletes a user's profile and stored contact details. List subscriptions and
      # preferences are separate resources, so remove those too if required.
      #
      # @overload delete(user_id, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
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
      # Overwrites a user profile in full, removing any key absent from the request
      # body. Use the patch endpoint when changing a single field.
      #
      # @overload replace(user_id, profile:, request_options: {})
      #
      # @param user_id [String] A unique identifier representing the user associated with the requested user pro
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

# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      class Checks
        # @overload update(submission_id, id:, checks:, request_options: {})
        #
        # @param submission_id [String] Path param:
        #
        # @param id [String] Path param:
        #
        # @param checks [Array<Courier::Models::Notifications::BaseCheck>] Body param:
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Notifications::CheckUpdateResponse]
        #
        # @see Courier::Models::Notifications::CheckUpdateParams
        def update(submission_id, params)
          parsed, options = Courier::Notifications::CheckUpdateParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["notifications/%1$s/%2$s/checks", id, submission_id],
            body: parsed,
            model: Courier::Models::Notifications::CheckUpdateResponse,
            options: options
          )
        end

        # @overload list(submission_id, id:, request_options: {})
        #
        # @param submission_id [String]
        # @param id [String]
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Notifications::CheckListResponse]
        #
        # @see Courier::Models::Notifications::CheckListParams
        def list(submission_id, params)
          parsed, options = Courier::Notifications::CheckListParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["notifications/%1$s/%2$s/checks", id, submission_id],
            model: Courier::Models::Notifications::CheckListResponse,
            options: options
          )
        end

        # @overload delete(submission_id, id:, request_options: {})
        #
        # @param submission_id [String]
        # @param id [String]
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Notifications::CheckDeleteParams
        def delete(submission_id, params)
          parsed, options = Courier::Notifications::CheckDeleteParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["notifications/%1$s/%2$s/checks", id, submission_id],
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

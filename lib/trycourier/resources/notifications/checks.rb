# frozen_string_literal: true

module Trycourier
  module Resources
    class Notifications
      class Checks
        # @overload update(submission_id, id:, checks:, request_options: {})
        #
        # @param submission_id [String] Path param:
        #
        # @param id [String] Path param:
        #
        # @param checks [Array<Trycourier::Models::BaseCheck>] Body param:
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Notifications::CheckUpdateResponse]
        #
        # @see Trycourier::Models::Notifications::CheckUpdateParams
        def update(submission_id, params)
          parsed, options = Trycourier::Notifications::CheckUpdateParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["notifications/%1$s/%2$s/checks", id, submission_id],
            body: parsed,
            model: Trycourier::Models::Notifications::CheckUpdateResponse,
            options: options
          )
        end

        # @overload list(submission_id, id:, request_options: {})
        #
        # @param submission_id [String]
        # @param id [String]
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Notifications::CheckListResponse]
        #
        # @see Trycourier::Models::Notifications::CheckListParams
        def list(submission_id, params)
          parsed, options = Trycourier::Notifications::CheckListParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["notifications/%1$s/%2$s/checks", id, submission_id],
            model: Trycourier::Models::Notifications::CheckListResponse,
            options: options
          )
        end

        # @overload delete(submission_id, id:, request_options: {})
        #
        # @param submission_id [String]
        # @param id [String]
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Notifications::CheckDeleteParams
        def delete(submission_id, params)
          parsed, options = Trycourier::Notifications::CheckDeleteParams.dump_request(params)
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
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end

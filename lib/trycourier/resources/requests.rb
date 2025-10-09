# frozen_string_literal: true

module Trycourier
  module Resources
    class Requests
      # Archive message
      #
      # @overload archive(request_id, request_options: {})
      #
      # @param request_id [String] A unique identifier representing the request ID
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::RequestArchiveParams
      def archive(request_id, params = {})
        @client.request(
          method: :put,
          path: ["requests/%1$s/archive", request_id],
          model: NilClass,
          options: params[:request_options]
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

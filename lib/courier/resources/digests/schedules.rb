# frozen_string_literal: true

module Courier
  module Resources
    class Digests
      class Schedules
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Digests::ScheduleListInstancesParams} for more details.
        #
        # List the digest instances for a schedule. Each instance represents the events
        # accumulated for a single user against the schedule, and can be used to monitor
        # digest accumulation before the digest is released.
        #
        # @overload list_instances(schedule_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param schedule_id [String] The ID of the digest schedule, in the form `sch/{uuid}`. The value must be URL-e
        #
        # @param cursor [String] A cursor token from a previous response, used to fetch the next page of results.
        #
        # @param limit [Integer] The maximum number of digest instances to return. Defaults to 20, with a maximum
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::DigestInstanceListResponse]
        #
        # @see Courier::Models::Digests::ScheduleListInstancesParams
        def list_instances(schedule_id, params = {})
          parsed, options = Courier::Digests::ScheduleListInstancesParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["digests/schedules/%1$s/instances", schedule_id],
            query: query,
            model: Courier::DigestInstanceListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Digests::ScheduleReleaseParams} for more details.
        #
        # Send a digest now instead of waiting for its scheduled time, so your users get
        # what they have collected so far right away.
        #
        # @overload release(schedule_id, request_options: {})
        #
        # @param schedule_id [String] The ID of the digest schedule to release, in the form `sch/{uuid}`. The value mu
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Digests::ScheduleReleaseParams
        def release(schedule_id, params = {})
          @client.request(
            method: :post,
            path: ["digests/schedules/%1$s/trigger", schedule_id],
            model: NilClass,
            options: params[:request_options]
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

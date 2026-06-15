# frozen_string_literal: true

module Courier
  module Models
    module Digests
      # @see Courier::Resources::Digests::Schedules#list_instances
      class ScheduleListInstancesParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute schedule_id
        #
        #   @return [String]
        required :schedule_id, String

        # @!attribute cursor
        #   A cursor token from a previous response, used to fetch the next page of results.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   The maximum number of digest instances to return. Defaults to 20, with a maximum
        #   of 100.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(schedule_id:, cursor: nil, limit: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Digests::ScheduleListInstancesParams} for more details.
        #
        #   @param schedule_id [String]
        #
        #   @param cursor [String] A cursor token from a previous response, used to fetch the next page of results.
        #
        #   @param limit [Integer] The maximum number of digest instances to return. Defaults to 20, with a maximum
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

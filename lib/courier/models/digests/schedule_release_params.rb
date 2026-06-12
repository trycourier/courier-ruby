# frozen_string_literal: true

module Courier
  module Models
    module Digests
      # @see Courier::Resources::Digests::Schedules#release
      class ScheduleReleaseParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute schedule_id
        #
        #   @return [String]
        required :schedule_id, String

        # @!method initialize(schedule_id:, request_options: {})
        #   @param schedule_id [String]
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end

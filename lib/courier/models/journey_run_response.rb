# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunResponse < Courier::Internal::Type::BaseModel
      # @!attribute run
      #   One run of a Journey. `status` and `created_at` are absent on a small number of
      #   legacy runs stored without them.
      #
      #   @return [Courier::Models::JourneyRun]
      required :run, -> { Courier::JourneyRun }

      # @!method initialize(run:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyRunResponse} for more details.
      #
      #   A single Journey run.
      #
      #   @param run [Courier::Models::JourneyRun] One run of a Journey. `status` and `created_at` are absent on a small number of
    end
  end
end

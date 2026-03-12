# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#invoke
    class JourneysInvokeResponse < Courier::Internal::Type::BaseModel
      # @!attribute run_id
      #   A unique identifier for the journey run that was created.
      #
      #   @return [String]
      required :run_id, String, api_name: :runId

      # @!method initialize(run_id:)
      #   @param run_id [String] A unique identifier for the journey run that was created.
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#create_job
    class BulkCreateJobResponse < Courier::Internal::Type::BaseModel
      # @!attribute job_id
      #
      #   @return [String]
      required :job_id, String, api_name: :jobId

      # @!method initialize(job_id:)
      #   @param job_id [String]
    end
  end
end

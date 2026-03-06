# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#retrieve_job
    class BulkRetrieveJobParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute job_id
      #
      #   @return [String]
      required :job_id, String

      # @!method initialize(job_id:, request_options: {})
      #   @param job_id [String]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

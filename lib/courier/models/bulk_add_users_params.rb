# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Bulk#add_users
    class BulkAddUsersParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute job_id
      #
      #   @return [String]
      required :job_id, String

      # @!attribute users
      #
      #   @return [Array<Courier::Models::InboundBulkMessageUser>]
      required :users, -> { Courier::Internal::Type::ArrayOf[Courier::InboundBulkMessageUser] }

      # @!method initialize(job_id:, users:, request_options: {})
      #   @param job_id [String]
      #   @param users [Array<Courier::Models::InboundBulkMessageUser>]
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end

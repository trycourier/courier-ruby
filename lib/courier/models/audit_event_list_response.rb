# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::AuditEvents#list
    class AuditEventListResponse < Courier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Courier::Models::Paging]
      required :paging, -> { Courier::Paging }

      # @!attribute results
      #
      #   @return [Array<Courier::Models::AuditEvent>]
      required :results, -> { Courier::Internal::Type::ArrayOf[Courier::AuditEvent] }

      # @!method initialize(paging:, results:)
      #   @param paging [Courier::Models::Paging]
      #   @param results [Array<Courier::Models::AuditEvent>]
    end
  end
end

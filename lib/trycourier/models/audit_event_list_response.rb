# frozen_string_literal: true

module Trycourier
  module Models
    # @see Trycourier::Resources::AuditEvents#list
    class AuditEventListResponse < Trycourier::Internal::Type::BaseModel
      # @!attribute paging
      #
      #   @return [Trycourier::Models::Paging]
      required :paging, -> { Trycourier::Paging }

      # @!attribute results
      #
      #   @return [Array<Trycourier::Models::AuditEvent>]
      required :results, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::AuditEvent] }

      # @!method initialize(paging:, results:)
      #   @param paging [Trycourier::Models::Paging]
      #   @param results [Array<Trycourier::Models::AuditEvent>]
    end
  end
end

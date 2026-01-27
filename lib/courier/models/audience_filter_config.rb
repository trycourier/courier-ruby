# frozen_string_literal: true

module Courier
  module Models
    class AudienceFilterConfig < Courier::Internal::Type::BaseModel
      # @!attribute filters
      #   Array of filter rules (single conditions or nested groups)
      #
      #   @return [Array<Courier::Models::FilterConfig>]
      required :filters, -> { Courier::Internal::Type::ArrayOf[Courier::FilterConfig] }

      # @!method initialize(filters:)
      #   Filter configuration for audience membership containing an array of filter rules
      #
      #   @param filters [Array<Courier::Models::FilterConfig>] Array of filter rules (single conditions or nested groups)
    end
  end
end

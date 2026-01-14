# frozen_string_literal: true

module Trycourier
  module Models
    class AudienceFilterConfig < Trycourier::Internal::Type::BaseModel
      # @!attribute filters
      #   Array of filter rules (single conditions or nested groups)
      #
      #   @return [Array<Trycourier::Models::FilterConfig>]
      required :filters, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::FilterConfig] }

      # @!method initialize(filters:)
      #   Filter configuration for audience membership containing an array of filter rules
      #
      #   @param filters [Array<Trycourier::Models::FilterConfig>] Array of filter rules (single conditions or nested groups)
    end
  end
end

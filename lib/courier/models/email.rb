# frozen_string_literal: true

module Courier
  module Models
    class Email < Courier::Internal::Type::BaseModel
      # @!attribute footer
      #
      #   @return [Object]
      required :footer, Courier::Internal::Type::Unknown

      # @!attribute header
      #
      #   @return [Object]
      required :header, Courier::Internal::Type::Unknown

      # @!method initialize(footer:, header:)
      #   @param footer [Object]
      #   @param header [Object]
    end
  end
end

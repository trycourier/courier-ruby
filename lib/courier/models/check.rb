# frozen_string_literal: true

module Courier
  module Models
    class Check < Courier::Models::BaseCheck
      # @!attribute updated
      #
      #   @return [Integer]
      required :updated, Integer

      # @!method initialize(updated:)
      #   @param updated [Integer]
    end
  end
end

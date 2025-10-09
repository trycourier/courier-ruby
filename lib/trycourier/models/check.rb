# frozen_string_literal: true

module Trycourier
  module Models
    class Check < Trycourier::Models::BaseCheck
      # @!attribute updated
      #
      #   @return [Integer]
      required :updated, Integer

      # @!method initialize(updated:)
      #   @param updated [Integer]
    end
  end
end

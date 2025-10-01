# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      class Check < Courier::Models::Notifications::BaseCheck
        # @!attribute updated
        #
        #   @return [Integer]
        required :updated, Integer

        # @!method initialize(updated:)
        #   @param updated [Integer]
      end
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    class Rule < Courier::Internal::Type::BaseModel
      # @!attribute until_
      #
      #   @return [String]
      required :until_, String, api_name: :until

      # @!attribute start
      #
      #   @return [String, nil]
      optional :start, String, nil?: true

      # @!method initialize(until_:, start: nil)
      #   @param until_ [String]
      #   @param start [String, nil]
    end
  end
end

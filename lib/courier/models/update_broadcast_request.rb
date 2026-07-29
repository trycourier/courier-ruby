# frozen_string_literal: true

module Courier
  module Models
    class UpdateBroadcastRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #   New human-readable name.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:)
      #   Request body for updating a broadcast. Only the name is mutable.
      #
      #   @param name [String] New human-readable name.
    end
  end
end

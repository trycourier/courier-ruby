# frozen_string_literal: true

module Trycourier
  module Models
    class Token < Trycourier::Internal::Type::BaseModel
      # @!attribute token
      #
      #   @return [String]
      required :token, String

      # @!method initialize(token:)
      #   @param token [String]
    end
  end
end

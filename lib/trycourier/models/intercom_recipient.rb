# frozen_string_literal: true

module Trycourier
  module Models
    class IntercomRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   @param id [String]
    end
  end
end

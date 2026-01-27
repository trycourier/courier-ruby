# frozen_string_literal: true

module Courier
  module Models
    class IntercomRecipient < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   @param id [String]
    end
  end
end

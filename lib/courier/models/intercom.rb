# frozen_string_literal: true

module Courier
  module Models
    class Intercom < Courier::Internal::Type::BaseModel
      # @!attribute from
      #
      #   @return [String]
      required :from, String

      # @!attribute to
      #
      #   @return [Courier::Models::IntercomRecipient]
      required :to, -> { Courier::IntercomRecipient }

      # @!method initialize(from:, to:)
      #   @param from [String]
      #   @param to [Courier::Models::IntercomRecipient]
    end
  end
end

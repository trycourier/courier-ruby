# frozen_string_literal: true

module Trycourier
  module Models
    class Intercom < Trycourier::Internal::Type::BaseModel
      # @!attribute from
      #
      #   @return [String]
      required :from, String

      # @!attribute to
      #
      #   @return [Trycourier::Models::IntercomRecipient]
      required :to, -> { Trycourier::IntercomRecipient }

      # @!method initialize(from:, to:)
      #   @param from [String]
      #   @param to [Trycourier::Models::IntercomRecipient]
    end
  end
end

# frozen_string_literal: true

module Trycourier
  module Models
    module PreferenceStatus
      extend Trycourier::Internal::Type::Enum

      OPTED_IN = :OPTED_IN
      OPTED_OUT = :OPTED_OUT
      REQUIRED = :REQUIRED

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end

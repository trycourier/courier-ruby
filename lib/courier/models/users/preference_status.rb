# frozen_string_literal: true

module Courier
  module Models
    module Users
      module PreferenceStatus
        extend Courier::Internal::Type::Enum

        OPTED_IN = :OPTED_IN
        OPTED_OUT = :OPTED_OUT
        REQUIRED = :REQUIRED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end

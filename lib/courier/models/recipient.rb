# frozen_string_literal: true

module Courier
  module Models
    module Recipient
      extend Courier::Internal::Type::Union

      variant -> { Courier::UserRecipient }

      variant -> { Courier::ListRecipient }

      # @!method self.variants
      #   @return [Array(Courier::Models::UserRecipient, Courier::Models::ListRecipient)]
    end
  end
end

# frozen_string_literal: true

module Courier
  module Models
    module Discord
      extend Courier::Internal::Type::Union

      variant -> { Courier::SendToChannel }

      variant -> { Courier::SendDirectMessage }

      # @!method self.variants
      #   @return [Array(Courier::Models::SendToChannel, Courier::Models::SendDirectMessage)]
    end
  end
end

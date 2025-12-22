# frozen_string_literal: true

module Trycourier
  module Models
    module Discord
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::SendToChannel }

      variant -> { Trycourier::SendDirectMessage }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::SendToChannel, Trycourier::Models::SendDirectMessage)]
    end
  end
end

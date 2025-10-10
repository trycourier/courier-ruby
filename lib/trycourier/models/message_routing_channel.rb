# frozen_string_literal: true

module Trycourier
  module Models
    module MessageRoutingChannel
      extend Trycourier::Internal::Type::Union

      variant String

      variant -> { Trycourier::MessageRouting }

      # @!method self.variants
      #   @return [Array(String, Trycourier::Models::MessageRouting)]
    end
  end
end

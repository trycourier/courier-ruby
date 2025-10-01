# frozen_string_literal: true

module Courier
  module Models
    module MessageRoutingChannel
      extend Courier::Internal::Type::Union

      variant String

      variant -> { Courier::MessageRouting }

      # @!method self.variants
      #   @return [Array(String, Courier::Models::MessageRouting)]
    end
  end
end

# frozen_string_literal: true

module Trycourier
  module Models
    module Slack
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::SendToSlackChannel }

      variant -> { Trycourier::SendToSlackEmail }

      variant -> { Trycourier::SendToSlackUserID }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::SendToSlackChannel, Trycourier::Models::SendToSlackEmail, Trycourier::Models::SendToSlackUserID)]
    end
  end
end

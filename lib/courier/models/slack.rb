# frozen_string_literal: true

module Courier
  module Models
    module Slack
      extend Courier::Internal::Type::Union

      variant -> { Courier::SendToSlackChannel }

      variant -> { Courier::SendToSlackEmail }

      variant -> { Courier::SendToSlackUserID }

      # @!method self.variants
      #   @return [Array(Courier::Models::SendToSlackChannel, Courier::Models::SendToSlackEmail, Courier::Models::SendToSlackUserID)]
    end
  end
end

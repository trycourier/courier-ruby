# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # Why one device's render failed, when its `status` is `FAILED` and the cause has
        # a public name. `DELIVERY_FAILED` means the rendering service could not deliver
        # the message to its own capture mailbox — infrastructure, not anything wrong with
        # the template.
        module PreviewResultFailureReason
          extend Courier::Internal::Type::Enum

          DELIVERY_FAILED = :DELIVERY_FAILED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      PreviewResultFailureReason = Previews::PreviewResultFailureReason
    end
  end
end

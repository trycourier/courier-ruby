# typed: strong

module Courier
  module Models
    # Send to a Slack address directly, bypassing the recipient's stored profile.
    # Requires exactly one of `channel`, `user_id`, or `email`.
    module JourneySendNodeToSlack
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::JourneySendNodeToSlackChannel,
            Courier::JourneySendNodeToSlackUserID,
            Courier::JourneySendNodeToSlackEmail
          )
        end

      sig do
        override.returns(T::Array[Courier::JourneySendNodeToSlack::Variants])
      end
      def self.variants
      end
    end
  end
end

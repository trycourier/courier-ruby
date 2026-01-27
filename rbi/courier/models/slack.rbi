# typed: strong

module Courier
  module Models
    module Slack
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::SendToSlackChannel,
            Courier::SendToSlackEmail,
            Courier::SendToSlackUserID
          )
        end

      sig { override.returns(T::Array[Courier::Slack::Variants]) }
      def self.variants
      end
    end
  end
end

# typed: strong

module Trycourier
  module Models
    module Slack
      extend Trycourier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Trycourier::SendToSlackChannel,
            Trycourier::SendToSlackEmail,
            Trycourier::SendToSlackUserID
          )
        end

      sig { override.returns(T::Array[Trycourier::Slack::Variants]) }
      def self.variants
      end
    end
  end
end

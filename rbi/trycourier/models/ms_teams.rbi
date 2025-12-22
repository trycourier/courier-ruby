# typed: strong

module Trycourier
  module Models
    module MsTeams
      extend Trycourier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Trycourier::SendToMsTeamsUserID,
            Trycourier::SendToMsTeamsEmail,
            Trycourier::SendToMsTeamsChannelID,
            Trycourier::SendToMsTeamsConversationID,
            Trycourier::SendToMsTeamsChannelName
          )
        end

      sig { override.returns(T::Array[Trycourier::MsTeams::Variants]) }
      def self.variants
      end
    end
  end
end

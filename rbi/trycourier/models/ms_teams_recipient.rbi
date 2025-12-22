# typed: strong

module Trycourier
  module Models
    class MsTeamsRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::MsTeamsRecipient, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Trycourier::SendToMsTeamsUserID,
            Trycourier::SendToMsTeamsEmail,
            Trycourier::SendToMsTeamsChannelID,
            Trycourier::SendToMsTeamsConversationID,
            Trycourier::SendToMsTeamsChannelName
          )
        )
      end
      attr_accessor :ms_teams

      # Send via Microsoft Teams
      sig do
        params(
          ms_teams:
            T.any(
              Trycourier::SendToMsTeamsUserID::OrHash,
              Trycourier::SendToMsTeamsEmail::OrHash,
              Trycourier::SendToMsTeamsChannelID::OrHash,
              Trycourier::SendToMsTeamsConversationID::OrHash,
              Trycourier::SendToMsTeamsChannelName::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(ms_teams:)
      end

      sig do
        override.returns(
          {
            ms_teams:
              T.any(
                Trycourier::SendToMsTeamsUserID,
                Trycourier::SendToMsTeamsEmail,
                Trycourier::SendToMsTeamsChannelID,
                Trycourier::SendToMsTeamsConversationID,
                Trycourier::SendToMsTeamsChannelName
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end

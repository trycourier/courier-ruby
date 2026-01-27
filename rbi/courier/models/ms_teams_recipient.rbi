# typed: strong

module Courier
  module Models
    class MsTeamsRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MsTeamsRecipient, Courier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Courier::SendToMsTeamsUserID,
            Courier::SendToMsTeamsEmail,
            Courier::SendToMsTeamsChannelID,
            Courier::SendToMsTeamsConversationID,
            Courier::SendToMsTeamsChannelName
          )
        )
      end
      attr_accessor :ms_teams

      # Send via Microsoft Teams
      sig do
        params(
          ms_teams:
            T.any(
              Courier::SendToMsTeamsUserID::OrHash,
              Courier::SendToMsTeamsEmail::OrHash,
              Courier::SendToMsTeamsChannelID::OrHash,
              Courier::SendToMsTeamsConversationID::OrHash,
              Courier::SendToMsTeamsChannelName::OrHash
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
                Courier::SendToMsTeamsUserID,
                Courier::SendToMsTeamsEmail,
                Courier::SendToMsTeamsChannelID,
                Courier::SendToMsTeamsConversationID,
                Courier::SendToMsTeamsChannelName
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end

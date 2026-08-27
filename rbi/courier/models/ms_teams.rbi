# typed: strong

module Courier
  module Models
    # Provide at least one of `tenant_id` or `service_url`. If you provide both, they
    # must agree.
    module MsTeams
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::SendToMsTeamsUserID,
            Courier::SendToMsTeamsEmail,
            Courier::SendToMsTeamsChannelID,
            Courier::SendToMsTeamsConversationID,
            Courier::SendToMsTeamsChannelName
          )
        end

      sig { override.returns(T::Array[Courier::MsTeams::Variants]) }
      def self.variants
      end
    end
  end
end

# frozen_string_literal: true

module Trycourier
  module Models
    class SendToSlackUserID < Trycourier::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!method initialize(access_token:, user_id:)
      #   @param access_token [String]
      #   @param user_id [String]
    end
  end
end

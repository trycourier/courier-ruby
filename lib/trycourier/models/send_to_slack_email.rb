# frozen_string_literal: true

module Trycourier
  module Models
    class SendToSlackEmail < Trycourier::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String

      # @!attribute email
      #
      #   @return [String]
      required :email, String

      # @!method initialize(access_token:, email:)
      #   @param access_token [String]
      #   @param email [String]
    end
  end
end

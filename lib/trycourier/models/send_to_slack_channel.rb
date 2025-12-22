# frozen_string_literal: true

module Trycourier
  module Models
    class SendToSlackChannel < Trycourier::Internal::Type::BaseModel
      # @!attribute access_token
      #
      #   @return [String]
      required :access_token, String

      # @!attribute channel
      #
      #   @return [String]
      required :channel, String

      # @!method initialize(access_token:, channel:)
      #   @param access_token [String]
      #   @param channel [String]
    end
  end
end

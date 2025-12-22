# frozen_string_literal: true

module Trycourier
  module Models
    class SendToChannel < Trycourier::Internal::Type::BaseModel
      # @!attribute channel_id
      #
      #   @return [String]
      required :channel_id, String

      # @!method initialize(channel_id:)
      #   @param channel_id [String]
    end
  end
end
